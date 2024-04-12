// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:income_expence_app/model/income_expense_model.dart';

// final transactionProvider = StateNotifierProvider<TransactionNotifier, List<Transaction>>(
//   (ref) => TransactionNotifier(),
// );

// class TransactionNotifier extends StateNotifier<List<Transaction>> {
//   TransactionNotifier() : super([]);

//   void addTransaction(Transaction transaction) {

//     state = [...state, transaction];
//   }
// }

import 'package:income_expence_app/controller/service/expense_service.dart';
import 'package:income_expence_app/controller/service/firebase_income_service.dart';
import 'package:income_expence_app/model/expense_model.dart';
import 'package:income_expence_app/model/income_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'income_provider.g.dart';

@riverpod
class IncomeExpense extends _$IncomeExpense {
  @override
  List build() {
    return [];
  }

  Future<void> addIncome({
    required String? type,
    required String? discription,
    required double? amount,
  }) {
    final model = IncomeModel(
        id: null, type: type, discription: discription, amount: amount!);
    return ref.read(firebaseIncomeServiceProvider).addIncome(model);
  }

  Stream<List> getIncome() async* {
    yield* ref.read(firebaseIncomeServiceProvider).getAllIncome();
  }
   Future<void> addExpense({
    required String? type,
    required String? discription,
    required double? amount,
  }) {
    final model = ExpenseModel(
        id: null, type: type, discription: discription, amount: amount!);
    return ref.read(firebaseExpenseServiceProvider).addExpense(model);
  }

  Stream<List> getExpense() async* {
    yield* ref.read(firebaseExpenseServiceProvider).getExpense();
  }
}
