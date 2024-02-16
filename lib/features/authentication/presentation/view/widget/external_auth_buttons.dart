import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt/features/authentication/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:furni_hunt/features/authentication/presentation/view/widget/custom_alert_dialog.dart';
import 'package:gap/gap.dart';
import 'custom_auth_button.dart';

class ExternalAuthButtons extends StatelessWidget {
  const ExternalAuthButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAuthButton(
          title: "Login with Google",
          image: "assets/images/google_icon.png",
          onTap: () {
            BlocProvider.of<SignInCubit>(context).signInWithGoogle();
          },
        ),
        Gap(20),
        CustomAuthButton(
          title: "Login with Facebook",
          image: "assets/images/facebook_icon.png",
          onTap: () {
            showAlertDialog(context: context, text: 'Not Avilable Right Now');
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.of(context).pop();
            });
          },
        ),
      ],
    );
  }

}