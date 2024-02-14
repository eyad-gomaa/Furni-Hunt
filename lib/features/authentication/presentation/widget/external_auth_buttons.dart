import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'custom_auth_button.dart';

class ExternalAuthButtons extends StatelessWidget {
  const ExternalAuthButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAuthButton(
          title: "Login with Google",
          image: "assets/images/google_icon.png",
        ),
        Gap(20),
        CustomAuthButton(
          title: "Login with Facebook",
          image: "assets/images/facebook_icon.png",
        ),
      ],
    );
  }
}
