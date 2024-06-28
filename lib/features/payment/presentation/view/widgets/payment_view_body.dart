import 'package:flutter/material.dart';
import 'package:furni_hunt/core/resources/color_manager.dart';
import 'package:furni_hunt/features/cart_and_fav/presentation/view/widgets/app_main_button.dart';
import 'package:furni_hunt/features/home/data/model/product_model.dart';
import 'package:furni_hunt/features/payment/presentation/view/widgets/address_container.dart';
import 'package:furni_hunt/features/payment/presentation/view/widgets/check_out_products_list.dart';
import 'package:furni_hunt/features/payment/presentation/view/widgets/order_summary_section.dart';
import 'package:furni_hunt/features/payment/presentation/view/widgets/payment_bottom_sheet.dart';
import 'package:gap/gap.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({super.key, required this.myCartList});
  final List<ProductModel> myCartList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("products"),
                  const Gap(10),
                  CheckOutProducts(myCartList: myCartList),
                  const Gap(20),
                  const Text("Address"),
                  const Gap(20),
                  const AddressWidget(),
                  const Gap(20),
                  const Text("Order Summary"),
                  const Gap(20),
                  OrderSummary(
                    myCartList: myCartList,
                  )
                ],
              ),
            ),
          ),
        ),
        MainButton(
            onTap: () {
              showBottomSheet(
                context: context,
                backgroundColor: ColorManager.whiteShade,
                builder: (context) => PaymentBottomSheet(
                  amount: getTotalPrice(myCartList).toString(),
                ),
              );
            },
            title: "next")
      ],
    );
  }

  getTotalPrice(List<ProductModel> myCartList) {
    double totlalPrice = 0;
    for (ProductModel i in myCartList) {
      totlalPrice += int.parse(i.productPrice);
    }
    return totlalPrice.toInt();
  }
}
