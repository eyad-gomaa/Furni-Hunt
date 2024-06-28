// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductCartModel {
  String? productId;
  int? productQuantity;
  ProductCartModel({
    required this.productId,
    required this.productQuantity,
  });
  Map<String, dynamic> toJson() {
    return {
      "productId": productId,
      "productQuantity": productQuantity,
    };
  }
}
