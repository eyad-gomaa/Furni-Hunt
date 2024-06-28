import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furni_hunt/core/resources/color_manager.dart';
import 'package:furni_hunt/core/utils/app_router.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

AppBar customHomeAppBar(BuildContext context) {
  return AppBar(
    leading: Container(
        height: 42,
        width: 42,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Image.asset("assets/images/profile.png")),
    actions: [
      SizedBox(
        height: 42,
        width: 42,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: ColorManager.greyLighter, // Border color
              width: 1, // Border width
            ),
          ),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.magnifyingGlass,
                color: Theme.of(context).iconTheme.color,
                size: 20,
              )),
        ),
      ),
      const Gap(5),
      SizedBox(
        height: 42,
        width: 42,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: ColorManager.greyLighter, // Border color
              width: 1, // Border width
            ),
          ),
          child: IconButton(
              onPressed: () {
                GoRouter.of(context).push(RouterPath.favouritesView);
              },
              icon: Icon(
                FontAwesomeIcons.heart,
                color: Theme.of(context).iconTheme.color,
                size: 20,
              )),
        ),
      ),
      const Gap(20),
    ],
  );
}
