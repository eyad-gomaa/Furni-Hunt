import 'package:flutter/material.dart';
import 'package:furni_hunt/features/authentication/presentation/view/widget/custom_password_text_form_field.dart';
import 'package:furni_hunt/features/authentication/presentation/view/widget/custom_text_form_field.dart';
import 'package:furni_hunt/features/authentication/presentation/view/widget/form_field_label.dart';
import 'package:gap/gap.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({
    super.key,
    required TextEditingController emailController,
    required TextEditingController phoneNumberCodeController,
    required TextEditingController phoneNumberController,
    required TextEditingController passwordController,
    required TextEditingController nameController,
    required this.formKey,
  })  : _emailController = emailController,
        _phoneNumberCodeController = phoneNumberCodeController,
        _phoneNumberController = phoneNumberController,
        _passwordController = passwordController,
        _nameController = nameController;

  final TextEditingController _emailController;
  final TextEditingController _phoneNumberCodeController;
  final TextEditingController _phoneNumberController;
  final TextEditingController _passwordController;
  final TextEditingController _nameController;
  final Key formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FormFieldLabel(
            text: 'Name',
          ),
          CustomTextFormField(
            context: context,
            hint: 'John',
            validator: (String? value) =>
                value == null ? "required field" : null,
            controller: _nameController,
          ),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "Email",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.black,
                  ),
            ),
          ),
          CustomTextFormField(
            context: context,
            label: ' ',
            hint: 'Eg. jamesburnes@gmail.com',
            validator: (String? value) =>
                value == null ? "required field" : null,
            controller: _emailController,
            textInputType: TextInputType.emailAddress,
          ),
          const Gap(20),
          const FormFieldLabel(
            text: 'Phone Number',
          ),
          Row(
            children: [
              SizedBox(
                  width: MediaQuery.sizeOf(context).width * .21,
                  child: CustomTextFormField(
                    context: context,
                    hint: "+233",
                    validator: (value) =>
                        value == null ? "required field" : null,
                    controller: _phoneNumberCodeController,
                    maxLength: 5,
                    textInputType: TextInputType.phone,
                  )),
              const Gap(8),
              Expanded(
                child: CustomTextFormField(
                  context: context,
                  validator: (value) => value == null ? "required field" : null,
                  controller: _phoneNumberController,
                  textInputType: TextInputType.phone,
                ),
              ),
            ],
          ),
          const Gap(20),
          const FormFieldLabel(
            text: 'Password',
          ),
          CustomPasswordTextFormField(
            context: context,
            validator: (value) => value == null ? "required field" : null,
            controller: _passwordController,
          )
        ],
      ),
    );
  }
}


