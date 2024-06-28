import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furni_hunt/core/shared.dart';
import 'package:furni_hunt/features/home/data/model/product_model.dart';
import 'package:furni_hunt/features/cart_and_fav/presentation/manager/cart_and_favourites_cubit/cart_and_favourites_cubit.dart';
import 'package:furni_hunt/features/home/presentation/view/widget/name_and_price_section.dart';
import 'package:furni_hunt/features/home/presentation/view/widget/product_view_image.dart';
import 'package:furni_hunt/features/onboarding/presentation/widget/custom_button.dart';
import 'package:gap/gap.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartAndFavouritesCubit, CartAndFavouritesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: ProductViewImage(
                  productImages: product.productImage,
                )),
                SliverToBoxAdapter(
                  child: NameAndPriceSection(product: product),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      product.productDescription,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width - 120,
                  child: CustomButton(
                    text: cartList.contains(product.productId)
                        ? 'Remove from cart'
                        : 'Add to cart',
                    onTap: () {
                      BlocProvider.of<CartAndFavouritesCubit>(context)
                          .addToCart(product: product);
                    },
                  ),
                ),
                const Gap(20),
                GestureDetector(
                  onTap: () async {
                    BlocProvider.of<CartAndFavouritesCubit>(context)
                        .addToFavourites(product: product);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(
                      wishList.contains(product.productId)
                          ? FontAwesomeIcons.heartCircleCheck
                          : FontAwesomeIcons.heart,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                )
              ]),
            )
          ],
        );
      },
    );
  }
}
