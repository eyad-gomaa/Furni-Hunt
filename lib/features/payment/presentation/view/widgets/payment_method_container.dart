import 'package:flutter/material.dart';
import 'package:furni_hunt/core/resources/color_manager.dart';
import 'package:gap/gap.dart';

class PaymentMethodContainer extends StatelessWidget {
  const PaymentMethodContainer({
    super.key,
    required this.image,
    required this.onTap,
    required this.showBorder,
    required this.title,
  });
  final String image;
  final String title;
  final void Function() onTap;
  final bool showBorder;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: Column(
          children: [
            AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.bounceInOut,
                height: 40,
                width: 60,
                decoration: BoxDecoration(
                    color: ColorManager.white,
                    border: showBorder
                        ? Border.all(color: ColorManager.primary)
                        : Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    image,
                    fit: BoxFit.scaleDown,
                  ),
                )),
            const Gap(5),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: ColorManager.black),
            )
          ],
        ),
      ),
    );
  }
}
