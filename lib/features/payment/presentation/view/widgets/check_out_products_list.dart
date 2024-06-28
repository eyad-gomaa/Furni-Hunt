import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:furni_hunt/core/resources/color_manager.dart';
import 'package:furni_hunt/features/home/data/model/product_model.dart';
import 'package:gap/gap.dart';

class CheckOutProducts extends StatelessWidget {
  const CheckOutProducts({
    super.key,
    required this.myCartList,
  });

  final List<ProductModel> myCartList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: myCartList.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Container(
              decoration: BoxDecoration(
                color: ColorManager.whiteShade,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: ColorManager.whiteShade,
                        borderRadius: BorderRadius.circular(8)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: myCartList[index].productImage[0],
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  ),
                  const Gap(20),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width - 130,
                    child: Text(
                      myCartList[index].productName,
                      style: Theme.of(context).textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
