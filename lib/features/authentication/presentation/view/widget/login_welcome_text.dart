import 'package:flutter/material.dart';
import 'package:furni_hunt/core/resources/color_manager.dart';

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
        Row(
          children: [
            Text("Welcome To ",
                style: Theme.of(context).textTheme.displaySmall),
            Text("FurniHunt.io",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: ColorManager.primary)),
          ],
        ),
      ],
    );
  }
}

class ColorManger {}
