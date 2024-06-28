import 'package:flutter/material.dart';
import 'package:furni_hunt/features/home/data/model/product_model.dart';
import 'package:furni_hunt/features/home/presentation/view/widget/product_view_body.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ProductViewBody(
            product: product,
          )),
    );
  }
}
