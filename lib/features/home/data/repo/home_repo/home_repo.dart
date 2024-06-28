import 'package:dartz/dartz.dart';
import 'package:furni_hunt/core/utils/failure/failure.dart';
import 'package:furni_hunt/features/home/data/model/product_model.dart';

abstract class HomeRepo {
  Future<Either<List<ProductModel>, Failure>> fetchProducts();
  Future<Either<List<ProductModel>, Failure>> fetchProductsCategory(
      {required String category});
  fetchFavouriteAndCart({required List<ProductModel>? productList});

}
