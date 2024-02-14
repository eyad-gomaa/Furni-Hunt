import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:furni_hunt/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_size_manager.dart';
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
                    Text("WELCOME",
                        style: TextStyle(
                            fontSize: FontSizeManager.fontSize16,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.primary)),
                    Text("FurniHunt.io",
                        style: TextStyle(
                            fontSize: FontSizeManager.fontSize42,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.white)),
                    Text(
                      "We serve you with the best gadgets for your home workspace",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: ColorManager.white),
                    ),
                    const SizedBox(
                      height: 39,
                    ),
                    CustomButton(
                      text: "Browse Shop",
                      onTap: () {},
                    ),
                    Center(
                      child: TextButton(
                          onPressed: () {
                            GoRouter.of(context).push(RouterPath.loginView);
                          },
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
