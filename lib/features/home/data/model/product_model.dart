import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String productName;
  final String productId;
  final String productPrice;
  final String productCategory;
  final String productDescription;
  List<dynamic> productImage;
  final String productQuantity;
  final Timestamp createdAt;

  ProductModel(
      {required this.productId,
      required this.productPrice,
      required this.productCategory,
      required this.productDescription,
      required this.productImage,
      required this.productQuantity,
      required this.createdAt,
      required this.productName});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'productName': productName,
      'productId': productId,
      'productPrice': productPrice,
      'productCategory': productCategory,
      'productDescription': productDescription,
      'productImage': productImage,
      'productQuantity': productQuantity,
      'createdAt': createdAt,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json['productName'],
      productId: json['productId'] as String,
      productPrice: json['productPrice'] as String,
      productCategory: json['productCategory'] as String,
      productDescription: json['productDescription'] as String,
      productImage: json['productImage'],
      productQuantity: json['productQuantity'] as String,
      createdAt: json['createdAt'],
    );
  }
}
