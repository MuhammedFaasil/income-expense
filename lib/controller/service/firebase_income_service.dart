import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:income_expence_app/model/income_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_income_service.g.dart';

class FirebaseIncomeService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final collection = FirebaseFirestore.instance
      .collection("income")
      .withConverter(
          fromFirestore: IncomeModel.fromFirestore,
          toFirestore: (model, _) => model.toFirestore());

  Future<void> addIncome(IncomeModel model) async {
    await collection.doc().set(model);
  }

  Stream<List<IncomeModel>> getAllIncome() {
    final incomeStream = collection.snapshots(includeMetadataChanges: true);
    return incomeStream.map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }
}

@riverpod
FirebaseIncomeService firebaseIncomeService(FirebaseIncomeServiceRef ref) {
  return FirebaseIncomeService();
}
