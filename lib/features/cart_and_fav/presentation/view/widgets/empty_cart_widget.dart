import 'package:flutter/material.dart';
import 'package:furni_hunt/core/resources/color_manager.dart';
import 'package:furni_hunt/core/resources/font_size_manager.dart';
import 'package:gap/gap.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: 150,
            width: 150,
            child: Image.asset(
              "assets/images/cart.png",
              fit: BoxFit.fill,
            )),
        const Gap(20),
        Text(
          "Empty Cart",
          style: TextStyle(
              color: ColorManager.secondary,
              fontSize: FontSizeManager.fontSize21),
        )
      ],
    ));
  }
}
