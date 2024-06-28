import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt/features/home/data/model/product_model.dart';
import 'package:furni_hunt/features/cart_and_fav/presentation/manager/cart_and_favourites_cubit/cart_and_favourites_cubit.dart';
import 'package:furni_hunt/features/cart_and_fav/presentation/view/widgets/custom_wish_product_container.dart';

class FavouritesViewBody extends StatelessWidget {
  const FavouritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartAndFavouritesCubit, CartAndFavouritesState>(
      builder: (context, state) {
        List<ProductModel> myWishList =
            BlocProvider.of<CartAndFavouritesCubit>(context).myWishList;
        return ListView.builder(
          itemCount: myWishList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
              child:
                  CustomWishProductContainer(productModel: myWishList[index]),
            );
          },
        );
      },
    );
  }
}

// if(state is FetchFavouritesSuccess || state is AddToFavouritesSuccess){
//           return ListView.builder(
//           itemBuilder: (context, index) {
//             return null;
//           },
//         );
//         }else if(state is FetchFavouritesFailure){
//           return Text(state.errMessage);
//         }else{
//           return Center(child: CircularProgressIndicator(),);
//         }