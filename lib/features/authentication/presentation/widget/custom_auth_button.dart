import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    super.key,
    required this.title,
    required this.image,
  });
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.fromBorderSide(
                BorderSide(width: 0.6, color: ColorManager.greyDeep))),
        child: Row(
          children: [
            const Spacer(
              flex: 1,
            ),
            Image.asset(
              image,
            ),
            const Spacer(
              flex: 1,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
