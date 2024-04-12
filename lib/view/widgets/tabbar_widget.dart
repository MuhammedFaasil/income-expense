import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:income_expence_app/view/pages/expense_page.dart';
import 'package:income_expence_app/view/pages/income_page.dart';

class IncomeExpenseTabBarWidget extends ConsumerWidget {
  const IncomeExpenseTabBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const TabBar(
                labelColor: Colors.red,
                indicatorColor:Colors.red,
                tabs: [
                  Tab(
                    text: 'Income',
                  ),
                  Tab(
                    text: 'Expense',
                  )
                ],
              ),
            ),
            body: const TabBarView(children: [IncomePage(), ExpensePage()]),
          ),
        ));
  }
}