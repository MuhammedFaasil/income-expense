import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:income_expence_app/controller/provider/income_provider.dart';
import 'package:income_expence_app/model/income_model.dart';
import 'package:income_expence_app/view/pages/add_page.dart';
import 'package:income_expence_app/view/widgets/income_widget.dart';

class IncomePage extends ConsumerWidget {
  const IncomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: StreamBuilder(
          stream: ref.watch(incomeExpenseProvider.notifier).getIncome(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return IncomeWidget(
                model: snapshot.data as List<IncomeModel>);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddIncomePage(),
                ));
          },
          child: const Icon(Icons.add),
        ));
  }
}
