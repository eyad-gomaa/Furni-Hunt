import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';

class LoginWelcomeText extends StatelessWidget {
  const LoginWelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hi 👋",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: ColorManager.greyDeeper2),
        ),
        Text("Welcome Back", style: Theme.of(context).textTheme.displayMedium),
      ],
    );
  }
}
