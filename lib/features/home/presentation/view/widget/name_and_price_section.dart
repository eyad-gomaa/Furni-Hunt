import 'package:flutter/material.dart';
import 'package:furni_hunt/core/resources/color_manager.dart';
import 'package:furni_hunt/features/home/data/model/product_model.dart';

class NameAndPriceSection extends StatelessWidget {
  const NameAndPriceSection({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width - 140,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.productName,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Text(
                  product.productCategory,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          PriceContainer(product: product),
        ],
      ),
    );
  }
}

class PriceContainer extends StatelessWidget {
  const PriceContainer({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 79,
      height: 79,
      color: ColorManager.whiteShade,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "\$" + product.productPrice,
            style: TextStyle(
                color: ColorManager.greenDeep,
                fontSize: 21,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "7% off",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
