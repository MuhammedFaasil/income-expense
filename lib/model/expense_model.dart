// ignore_for_file: unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_model.freezed.dart';
part 'expense_model.g.dart';

@freezed
  class ExpenseModel with _$ExpenseModel {
  const ExpenseModel._();

  const factory ExpenseModel({
    required String? id,
    required String? type,
    required String? discription,
    required double amount,
  }) = _ExpenseModel;

  factory ExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseModelFromJson(json);

  factory ExpenseModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    data['id'] = snapshot.id;
    return ExpenseModel.fromJson(data);
  }
  Map<String, dynamic> toFirestore() {
    return toJson()..remove('id');
  }
}
