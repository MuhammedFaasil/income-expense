// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:income_expence_app/model/expense_model.dart';

class ExpenseWidget extends StatelessWidget {
  List<ExpenseModel> model;
  ExpenseWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 5,
        );
      },
      shrinkWrap: true,
      itemCount: model.length,
      itemBuilder: (context, index) {
        final datas = model[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red[100],
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 4, color: Colors.black, spreadRadius: .1)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Type: ${datas.type!.isEmpty ? 'no type' : datas.type}",
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  "Amount: ${datas.amount}",
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  "Discription: ${datas.discription!.isEmpty ? 'no discription' : datas.discription}",
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
