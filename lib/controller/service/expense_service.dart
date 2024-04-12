import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:income_expence_app/model/expense_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'expense_service.g.dart';

class ExpenseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final collection = FirebaseFirestore.instance
      .collection("expense")
      .withConverter(
          fromFirestore: ExpenseModel.fromFirestore,
          toFirestore: (model, _) => model.toFirestore());

  Future<void> addExpense(ExpenseModel model) async {
    await collection.doc().set(model);
  }

  Stream<List<ExpenseModel>> getExpense() {
    final incomeStream = collection.snapshots(includeMetadataChanges: true);
    return incomeStream.map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }
}

@riverpod
ExpenseService firebaseExpenseService(FirebaseExpenseServiceRef ref) {
  return ExpenseService();
}
