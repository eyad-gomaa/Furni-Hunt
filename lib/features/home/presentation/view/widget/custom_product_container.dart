
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furni_hunt/core/resources/color_manager.dart';
import 'package:furni_hunt/features/home/data/model/product_model.dart';
import 'package:gap/gap.dart';

class CustomProductContainer extends StatelessWidget {
  const CustomProductContainer({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.fromBorderSide(BorderSide(
              color: ColorManager.greyLighter,
              width: 1))),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  width: 105,
                  height: 86,
                  decoration: BoxDecoration(
                      color: ColorManager.whiteShade,
                      borderRadius:
                          BorderRadius.circular(8)),
                  child: Image.network(
                      productModel.productImage[0]),
                ),
                Positioned(
                    top: 6,
                    right: 6,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.all(8.0),
                        child: Icon(
                          FontAwesomeIcons.heart,
                          color: ColorManager.primary,
                          size: 17,
                        ),
                      ),
                    ))
              ],
            ),
            const Gap(16),
            SizedBox(
              width: MediaQuery.sizeOf(context).width -
                  (20 + 20 + 105 + 16 + 20 + 20),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel.productName,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium,
                  ),
                  const Gap(4),
                  Text(
                    productModel.productCategory,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall,
                  ),
                  const Spacer(),
                  Text(
                    overflow: TextOverflow.clip,
                    "${productModel.productPrice} EGP",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(
                            color:
                                ColorManager.secondary),
                  ),
                  const Gap(10),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
