import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt/core/resources/color_manager.dart';
import 'package:furni_hunt/features/cart_and_fav/presentation/view/widgets/app_main_button.dart';
import 'package:furni_hunt/features/home/data/model/product_model.dart';
import 'package:furni_hunt/features/payment/data/model/payment_intent_input_model.dart';
import 'package:furni_hunt/features/payment/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:furni_hunt/features/payment/presentation/view/widgets/payment_method_container.dart';
import 'package:furni_hunt/features/payment/presentation/view/widgets/payment_view_body.dart';
import 'package:gap/gap.dart';

class PaymentBottomSheet extends StatefulWidget {
  const PaymentBottomSheet({
    super.key, required this.amount,
  });
final String amount;
  @override
  State<PaymentBottomSheet> createState() => _PaymentBottomSheetState();
}

class _PaymentBottomSheetState extends State<PaymentBottomSheet> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Select payment method",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PaymentMethodContainer(
                image: "assets/images/cash-on-delivery.png",
                onTap: () {
                  selectedIndex = 0;
                  setState(() {});
                },
                showBorder: selectedIndex == 0 ? true : false,
                title: 'Cash on Delivery',
              ),
              PaymentMethodContainer(
                image: "assets/images/debit-card.png",
                onTap: () {
                  selectedIndex = 1;
                  setState(() {});
                },
                showBorder: selectedIndex == 1 ? true : false,
                title: 'Card',
              ),
              PaymentMethodContainer(
                image: "assets/images/paypal.png",
                onTap: () {
                  selectedIndex = 2;
                  setState(() {});
                },
                showBorder: selectedIndex == 2 ? true : false,
                title: 'PayPal',
              ),
            ],
          ),
          MainButton(onTap: () {
                PaymentIntentInputModel paymentIntentInputModel =
                    PaymentIntentInputModel(
                  amount: widget.amount,
                  currency: 'usd',
                );
                BlocProvider.of<PaymentCubit>(context)
                    .makePayment(paymentIntentInput: paymentIntentInputModel);
              }, title: "Complete Payment")
        ],
      ),
    );
  }

}
