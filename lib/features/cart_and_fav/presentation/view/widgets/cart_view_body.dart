import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt/core/utils/app_router.dart';
import 'package:furni_hunt/features/cart_and_fav/presentation/view/widgets/app_main_button.dart';
import 'package:furni_hunt/features/cart_and_fav/presentation/view/widgets/custom_cart_product_card.dart';
import 'package:furni_hunt/features/cart_and_fav/presentation/view/widgets/empty_cart_widget.dart';
import 'package:furni_hunt/features/home/data/model/product_model.dart';
import 'package:furni_hunt/features/cart_and_fav/presentation/manager/cart_and_favourites_cubit/cart_and_favourites_cubit.dart';
import 'package:go_router/go_router.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartAndFavouritesCubit, CartAndFavouritesState>(
      builder: (context, state) {
        List<ProductModel> myCartList =
            BlocProvider.of<CartAndFavouritesCubit>(context).myCartList;
        return Stack(alignment: Alignment.bottomCenter, children: [
          ConditionalBuilder(
            condition: state is FetchFavouritesSuccess ||
                state is AddToFavouritesSuccess,
            builder: (BuildContext context) {
              if (myCartList.isNotEmpty) {
                return ListView.builder(
                  itemCount: myCartList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 10),
                      child: CustomCartProductCard(
                          productModel: myCartList[index]),
                    );
                  },
                );
              } else {
                return const EmptyCartWidget();
              }
            },
            fallback: (BuildContext context) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          BlocProvider.of<CartAndFavouritesCubit>(context).myCartList.isNotEmpty
              ? MainButton(
                  onTap: () {
                    GoRouter.of(context).push(RouterPath.paymentView,
                        extra: BlocProvider.of<CartAndFavouritesCubit>(context)
                            .myCartList);
                  },
                  title: "check out",
                )
              : const SizedBox.shrink(),
        ]);
      },
    );
  }
}
