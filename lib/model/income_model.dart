// ignore_for_file: unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'income_model.freezed.dart';
part 'income_model.g.dart';

@freezed
  class IncomeModel with _$IncomeModel {
  const IncomeModel._();

  const factory IncomeModel({
    required String? id,
    required String? type,
    required String? discription,
    required double amount,
  }) = _IncomeModel;

  factory IncomeModel.fromJson(Map<String, dynamic> json) =>
      _$IncomeModelFromJson(json);

  factory IncomeModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    data['id'] = snapshot.id;
    return IncomeModel.fromJson(data);
  }
  Map<String, dynamic> toFirestore() {
    return toJson()..remove('id');
  }
}
