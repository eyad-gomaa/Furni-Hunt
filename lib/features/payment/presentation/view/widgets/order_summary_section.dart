import 'package:flutter/material.dart';
import 'package:furni_hunt/core/resources/color_manager.dart';
import 'package:furni_hunt/core/resources/font_size_manager.dart';
import 'package:furni_hunt/features/home/data/model/product_model.dart';
import 'package:gap/gap.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key, required this.myCartList});
  final List<ProductModel> myCartList;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Price"),
            Text(getTotalPrice(myCartList).toString()),
          ],
        ),
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Coupon"),
            SizedBox(
                width: 100,
                height: 23,
                child: TextField(
                  onSubmitted: (value) {
                    print("done");
                  },
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: ColorManager.secondary,
                      fontSize: FontSizeManager.fontSize16),
                  decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      hintText: "VHT7X",
                      hintStyle: TextStyle(
                        color: ColorManager.secondary,
                        fontSize: FontSizeManager.fontSize16,
                      )),
                )),
          ],
        ),
        const Gap(10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Coupon discount amount"),
            Text("0"),
          ],
        ),
        Divider(
          thickness: 1,
          color: ColorManager.black,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total amount",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              "11500",
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
        Divider(
          thickness: 1,
          color: ColorManager.black,
        ),
      ],
    );
  }
}

getTotalPrice(List<ProductModel> myCartList) {
  double totlalPrice = 0;
  for (ProductModel i in myCartList) {
    totlalPrice += int.parse(i.productPrice);
  }
  return totlalPrice;
}
