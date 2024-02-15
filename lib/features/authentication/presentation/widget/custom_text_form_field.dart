import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.context,
      required this.label,
      required this.hint,
      required this.validator,
      required this.controller});
  final String label;
  final String hint;
  final BuildContext context;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: ColorManager.black),
      decoration: InputDecoration(
        label: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            label,
          ),
        ),
        hintText: hint,
      ),
      keyboardType: TextInputType.emailAddress,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      validator: validator,
      controller: controller,
    );
  }
}
