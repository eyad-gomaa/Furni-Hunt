import 'package:dartz/dartz.dart';
import 'package:furni_hunt/core/utils/failure/failure.dart';
import 'package:furni_hunt/features/home/data/model/product_model.dart';

abstract class CartAndFavouritesRepo{
    Future<Either<List<ProductModel>, Failure>> fetchFavouriteProducts();
  Future<Either<List<ProductModel>, Failure>> fetchCartProducts();
  // fetchFavouriteAndCart({required List<ProductModel>? productList});
  addToFavourites({required ProductModel product});
  deleteFromFavourites({required ProductModel product});
  addToCart({required ProductModel productModel});
  deleteFromCart({required ProductModel productModel});
}