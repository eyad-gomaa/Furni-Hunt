import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:furni_hunt/core/utils/failure/firebase_failure.dart';
import 'package:furni_hunt/features/home/data/model/product_model.dart';
import 'package:furni_hunt/features/home/data/repo/home_repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<List<ProductModel>, Failure>> fetchProducts() async {
    List<ProductModel> productList = [];
    try {
      final data = await FirebaseFirestore.instance
          .collection('products')
          .orderBy("createdAt", descending: false)
          .get();
      var products = data.docs;
      for (var element in products) {
        productList.add(ProductModel.fromJson(element.data()));
      }
      return left(productList);
    } on FirebaseException catch (e) {
      return right(
          FirebaseFailure.fromFirebaseException(failureMessage: e.code));
    }
  }

  @override
  Future<Either<List<ProductModel>, Failure>> fetchProductsCategory(
      {required String category}) async {
    List<ProductModel> categoryList = [];
    try {
      final data = await FirebaseFirestore.instance
          .collection("products")
          .where("productCategory", isEqualTo: category)
          .get();
      var products = data.docs;
      for (var element in products) {
        categoryList.add(ProductModel.fromJson(element.data()));
      }
      return left(categoryList);
    } on FirebaseException catch (e) {
      return right(
          FirebaseFailure.fromFirebaseException(failureMessage: e.code));
    }
  }
}
