import 'package:flutter/material.dart';

import 'package:furni_hunt/core/resources/color_manager.dart';

class AuthButtomOptions extends StatelessWidget {
  const AuthButtomOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: () {},
            child: Text(
              "Forgot password?",
              style: Theme.of(context).textTheme.bodySmall,
            )),
        TextButton(
            onPressed: () {},
            child: Text(
              "Sign Up",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: ColorManager.secondary),
            ))
      ],
    );
  }
}
