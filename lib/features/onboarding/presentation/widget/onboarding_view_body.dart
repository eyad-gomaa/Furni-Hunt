import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:furni_hunt/core/resources/font_style.dart';

import '../../../../core/resources/color_manager.dart';
import 'custom_button.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            color: Colors.red,
            child: Image.asset(
              "assets/images/OnboardingBgImage.png",
              fit: BoxFit.fill,
            )),
        Positioned(
          left: 0,
          right: 0,
          top: MediaQuery.sizeOf(context).height * 0.6,
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 0,
                sigmaY: 3,
              ), // Adjust the
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "WELCOME",
                      style: FontStyleManager.fontStyle16
                          .copyWith(color: ColorManager.primary),
                    ),
                    Text(
                      "FurniHunt.io",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Text(
                      "We serve you with the best gadgets for your home workspace",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: ColorManager.white),
                    ),
                    SizedBox(
                      height: 39,
                    ),
                    const CustomButton(
                      text: "Browse Shop",
                    ),
                    Center(
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Log In",
                            style: Theme.of(context).textTheme.bodyLarge,
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
