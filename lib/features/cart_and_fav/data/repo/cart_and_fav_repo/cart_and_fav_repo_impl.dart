import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:furni_hunt/core/utils/failure/failure.dart';
import 'package:furni_hunt/features/cart_and_fav/data/repo/cart_and_fav_repo/cart_and_fav_repo.dart';
import 'package:furni_hunt/features/home/data/model/product_model.dart';

class CartAndFavouritesRepoImpl implements CartAndFavouritesRepo {
@override
  addToFavourites({required ProductModel product}) async {
    String userUid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userUid)
        .collection("favourites")
        .doc(product.productId)
        .set(product.toJson());
  }

  @override
  deleteFromFavourites({required ProductModel product}) async {
    String userUid = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userUid)
        .collection("favourites")
        .doc(product.productId)
        .delete();
  }

  @override
  addToCart({required ProductModel productModel}) async {
    String userUid = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userUid)
        .collection("cart")
        .doc(productModel.productId)
        .set(productModel.toJson());
  }

  @override
  deleteFromCart({required ProductModel productModel}) async {
    String userUid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userUid)
        .collection("cart")
        .doc(productModel.productId)
        .delete();
  }

  @override
  Future<Either<List<ProductModel>, Failure>> fetchFavouriteProducts() async {
    try {
      List<ProductModel> products = [];
      var uid = FirebaseAuth.instance.currentUser!.uid;
      var data = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection("favourites")
          .get();
      for (var product in data.docs) {
        products.add(ProductModel.fromJson(product.data()));
      }
      return left(products);
    } on Exception catch (e) {
      return right(FirebaseFailure(failureMessage: e.toString()));
    }
  }
  @override
  Future<Either<List<ProductModel>, Failure>> fetchCartProducts() async {
    try {
      List<ProductModel> products = [];
      var uid = FirebaseAuth.instance.currentUser!.uid;
      var data = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection("cart")
          .get();
      for (var product in data.docs) {
        products.add(ProductModel.fromJson(product.data()));
      }
      return left(products);
    } on Exception catch (e) {
      return right(FirebaseFailure(failureMessage: e.toString()));
    }
  }
  
  // @override
  // fetchFavouriteAndCart({required List<ProductModel>? productList}) {
  //   // TODO: implement fetchFavouriteAndCart
  //   throw UnimplementedError();
  // }
}