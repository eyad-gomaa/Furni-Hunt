import 'package:flutter/material.dart';
import 'package:furni_hunt/features/home/data/model/product_model.dart';
import 'package:furni_hunt/features/home/presentation/view/widget/custom_product_container.dart';

class NewArrivalListView extends StatelessWidget {
  const NewArrivalListView({
    super.key,
    required this.productList,
  });

  final List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: productList.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: CustomProductContainer(productModel: productList[index]),
      ),
    );
  }
}