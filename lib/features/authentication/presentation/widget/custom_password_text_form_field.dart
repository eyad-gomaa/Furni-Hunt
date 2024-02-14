import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/resources/color_manager.dart';

class CustomPasswordTextFormField extends StatefulWidget {
  const CustomPasswordTextFormField({
    super.key,
    required this.context,
    required this.label,
    required this.hint,
    required this.validator,
    required this.controller,
  });
  final String label;
  final String hint;
  final BuildContext context;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;

  @override
  State<CustomPasswordTextFormField> createState() =>
      _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState
    extends State<CustomPasswordTextFormField> {
  bool showPassword = false;

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
              widget.label,
            ),
          ),
          hintText: widget.hint,
          hintStyle: Theme.of(context).textTheme.bodySmall,
          suffixIcon: GestureDetector(
            onTap: () {
              showPassword = !showPassword;
              setState(() {});
            },
            child: Icon(
              showPassword ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
              color: Colors.black,
            ),
          )),
      obscureText: !showPassword,
      keyboardType: TextInputType.emailAddress,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      validator: widget.validator,
      controller: widget.controller,
    );
  }
}

OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(8),
  );
}
