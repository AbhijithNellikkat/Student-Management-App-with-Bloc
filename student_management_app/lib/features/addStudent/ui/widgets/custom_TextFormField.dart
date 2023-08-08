import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.lable,
    this.keyboardType = TextInputType.name,
  });

  final TextEditingController controller;
  final String lable;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: const OutlineInputBorder(borderRadius: BorderRadius.zero),
        label: Text(lable),
      ),
    );
  }
}
