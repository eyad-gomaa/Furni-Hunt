import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:furni_hunt/core/resources/color_manager.dart';
import 'package:furni_hunt/core/resources/font_size_manager.dart';
import 'package:furni_hunt/core/utils/app_router.dart';
import 'package:furni_hunt/features/cart_and_fav/presentation/view/widgets/app_main_button.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class PaymentConfirmedViewBody extends StatelessWidget {
  const PaymentConfirmedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.asset("assets/images/payment_done.gif")),
                ),
                const Gap(20),
                FittedBox(
                  child: Text(
                    "Order Confirmed",
                    style: TextStyle(
                        color: ColorManager.secondary,
                        fontSize: FontSizeManager.fontSize28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          MainButton(
              onTap: () {
                while (context.canPop()) {
                  context.pop();
                }
                GoRouter.of(context).pushReplacement(RouterPath.homeView);
              },
              title: "Back To Home")
        ],
      ),
    );
  }
}
