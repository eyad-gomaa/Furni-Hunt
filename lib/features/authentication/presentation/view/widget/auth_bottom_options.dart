import 'package:flutter/material.dart';

import 'package:furni_hunt/core/resources/color_manager.dart';

class AuthButtomOptions extends StatelessWidget {
  const AuthButtomOptions({super.key,required this.leftOnPressed, required this.leftText, required this.rightOnPressed, required this.rightText});
  final Function()? leftOnPressed;
  final String leftText;
  final Function()? rightOnPressed;
  final String rightText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: leftOnPressed,
            child: Text(
              leftText,
              style: Theme.of(context).textTheme.bodySmall,
            )),
        TextButton(
            onPressed: rightOnPressed,
            child: Text(
              rightText,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: ColorManager.secondary),
            ))
      ],
    );
  }
}
