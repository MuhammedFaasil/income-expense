import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:income_expence_app/controller/provider/income_provider.dart';
import 'package:income_expence_app/model/expense_model.dart';
import 'package:income_expence_app/view/pages/add_expense_page.dart';
import 'package:income_expence_app/view/widgets/expense_widget.dart';

class ExpensePage extends ConsumerWidget {
  const ExpensePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: StreamBuilder(
          stream: ref.watch(incomeExpenseProvider.notifier).getExpense(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return ExpenseWidget(
                model: snapshot.data as List<ExpenseModel>);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddExpensePage(),
                ));
          },
          child: const Icon(Icons.add),
        ));
  }
}
