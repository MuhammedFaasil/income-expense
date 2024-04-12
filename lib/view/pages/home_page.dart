import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:income_expence_app/view/widgets/tabbar_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Income & Expense'),
        ),
        body: const IncomeExpenseTabBarWidget()
        // body: SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       SizedBox(
        //         height: 400,
        //         child: ListView.builder(
        //           shrinkWrap: true,
        //           itemCount: income.length,
        //           itemBuilder: (context, index) {
        //             if (income.isEmpty) {
        //               Text(
        //                 'No Data',
        //                 style: TextStyle(fontSize: 20, color: Colors.black),
        //               );
        //             }
        //             final transaction = income[index];
        //             return ListTile(
        //               title: Text(
        //                 '${transaction.type}: \$${transaction.amount.toStringAsFixed(2)}',
        //                 style: TextStyle(color: Colors.black),
        //               ),
        //             );
        //           },
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
