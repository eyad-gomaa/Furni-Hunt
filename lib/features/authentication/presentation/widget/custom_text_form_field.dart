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
      decoration: InputDecoration(
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        disabledBorder: buildOutlineInputBorder(),
        filled: true,
        fillColor: ColorManager.shade,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        labelStyle: Theme.of(context).textTheme.titleMedium,
        label: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            label,
          ),
        ),
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodySmall,
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

OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(8),
  );
}
