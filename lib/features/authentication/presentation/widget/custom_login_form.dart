import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'custom_password_text_form_field.dart';
import 'custom_text_form_field.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm(
      {super.key,
      required this.passwordController,
      required this.emailController,
      required this.formKey});
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Key formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
              context: context,
              label: "Email",
              hint: "Eg.jamesburnes@gmail.com",
              validator: (value) {
                if (value == null) {
                  return "Required Field";
                } else {
                  return "Success";
                }
              },
              controller: emailController),
          const Gap(26),
          CustomPasswordTextFormField(
            controller: passwordController,
            context: context,
            label: 'Password',
            hint: '',
            validator: (value) {
              if (value == null) {
                return "Required Field";
              } else {
                return "Success";
              }
            },
          )
        ],
      ),
    );
  }
}
