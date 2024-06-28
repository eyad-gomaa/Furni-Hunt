import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt/core/resources/color_manager.dart';
import 'package:furni_hunt/core/utils/app_router.dart';
import 'package:furni_hunt/features/authentication/presentation/view/widget/custom_snack_bar.dart';
import 'package:furni_hunt/features/cart_and_fav/presentation/manager/cart_and_favourites_cubit/cart_and_favourites_cubit.dart';
import 'package:furni_hunt/features/home/data/model/product_model.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CustomCartProductCard extends StatelessWidget {
  const CustomCartProductCard({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context)
                .push(RouterPath.productView, extra: productModel);
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: 110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.fromBorderSide(
                    BorderSide(color: ColorManager.greyLighter, width: 1))),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    width: 105,
                    height: 86,
                    decoration: BoxDecoration(
                        color: ColorManager.whiteShade,
                        borderRadius: BorderRadius.circular(8)),
                    child: CachedNetworkImage(
                      imageUrl: productModel.productImage[0],
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                  const Gap(16),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width -
                        (20 + 20 + 105 + 16 + 20 + 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productModel.productName,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const Gap(4),
                        Text(
                          productModel.productCategory,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const Spacer(),
                        Text(
                          overflow: TextOverflow.clip,
                          "${productModel.productPrice} EGP",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: ColorManager.secondary),
                        ),
                        const Gap(10),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 10,
            right: 10,
            child: BlocConsumer<CartAndFavouritesCubit, CartAndFavouritesState>(
              listener: (context, state) {
                if (state is AddToFavouritesFailure) {
                  customSnackBar(
                      context: context, message: "failed To Add To Favourites");
                }
              },
              builder: (context, state) {
                return GestureDetector(
                  onTap: () async {
                    BlocProvider.of<CartAndFavouritesCubit>(context)
                        .addToCart(product: productModel);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 25,
                      ),
                    ),
                  ),
                );
              },
            ))
      ],
    );
  }
}
