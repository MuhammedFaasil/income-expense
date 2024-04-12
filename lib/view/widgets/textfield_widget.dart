import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final TextInputType? keyboardType;
  const TextFieldWidget(
      {super.key,
      required this.controller,
      required this.labelText,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration:
          InputDecoration(labelText: labelText, border: const OutlineInputBorder()),
      keyboardType: keyboardType,
    );
  }
}
