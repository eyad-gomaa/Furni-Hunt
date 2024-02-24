import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furni_hunt/core/resources/color_manager.dart';
import 'package:furni_hunt/features/onboarding/presentation/widget/custom_button.dart';
import 'package:gap/gap.dart';

class PopularNowContainer extends StatelessWidget {
  const PopularNowContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -10,
            child: Text(
              "Popular now",
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.centerRight,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 192,
                decoration: BoxDecoration(
                    color: ColorManager.black,
                    borderRadius: BorderRadius.circular(32)),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width - 150,
                        child: Text(
                          "Adjustable Office Chair",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      Text("Hughlan Workspaces",
                          style: Theme.of(context).textTheme.bodySmall!),
                      const Gap(20),
                      Row(
                        children: [
                          SizedBox(
                              height: 42,
                              width: 111,
                              child:
                                  CustomButton(text: "View Item", onTap: () {})),
                          const Gap(12),
                          CircleAvatar(
                            backgroundColor:
                                ColorManager.greyDeeper2.withOpacity(0.5),
                            radius: 21,
                            child: Center(
                              child: Icon(
                                FontAwesomeIcons.bagShopping,
                                size: 20,
                                color: ColorManager.greyDeeper,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                    width: 129, child: Image.asset("assets/images/chair.png")),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
