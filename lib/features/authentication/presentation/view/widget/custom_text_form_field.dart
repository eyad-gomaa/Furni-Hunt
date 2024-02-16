import 'package:flutter/material.dart';
import 'package:furni_hunt/core/resources/color_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.context,
      this.label,
      this.hint,
      required this.validator,
      required this.controller,
      this.textInputType,
      this.maxLength});
  final String? label;
  final String? hint;
  final BuildContext context;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final TextInputType? textInputType;
  final int? maxLength;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextFormField(
        maxLength: maxLength,
        style: TextStyle(color: ColorManager.black),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12),
          counterText: '',
          label: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              label ?? "",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: ColorManager.black),
            ),
          ),
          hintText: hint ?? "",
        ),
        keyboardType: textInputType ?? TextInputType.text,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        validator: validator,
        controller: controller,
      ),
    );
  }
}
