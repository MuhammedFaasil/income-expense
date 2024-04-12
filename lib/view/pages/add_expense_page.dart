import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:income_expence_app/controller/provider/income_provider.dart';
import 'package:income_expence_app/view/widgets/textfield_widget.dart';

class AddExpensePage extends ConsumerWidget {
  const AddExpensePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typeController = TextEditingController();
    final amountController = TextEditingController();
    final descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                TextFieldWidget(
                    controller: typeController, labelText: 'Type of expense'),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                  controller: amountController,
                  labelText: 'Amount',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                    controller: descriptionController,
                    labelText: 'Description'),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    final amountText = amountController.text;
                    if (amountText.isNotEmpty) {
                      try {
                        final amount = double.parse(amountText);
                        ref.read(incomeExpenseProvider.notifier).addExpense(
                              type: typeController.text,
                              amount: amount,
                              discription: descriptionController.text,
                            );
                        typeController.clear();
                        amountController.clear();
                        descriptionController.clear();
                      } catch (e) {
                        log('Error parsing amount: $e');
                      }
                    }
                  },
                  child: const Text('Add expense'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
