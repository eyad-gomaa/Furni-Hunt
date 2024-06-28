import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:furni_hunt/features/home/data/model/product_model.dart';

class UserModel {
    final List<String> adresses;
    final List<ProductModel> cart;
    final Timestamp? dateCreated;
    final String? email;
    final String? name;
    String? custumerPaymentId;
    final List<ProductModel> orders;
    final String? phone;
    final int? points;
    final List<ProductModel> wish;
        UserModel({
        required this.adresses,
        required this.cart,
        required this.dateCreated,
        required this.email,
        required this.orders,
        required this.phone,
        required this.points,
        required this.wish,
        required this.name,
        this.custumerPaymentId,
    });
    factory UserModel.fromJson(Map<String, dynamic> json){ 
        return UserModel(
            adresses: json["adresses"] == null ? [] : List<String>.from(json["adresses"]!.map((x) => x)),
            cart: json["cart"] == null ? [] : List<ProductModel>.from(json["cart"]!.map((x) => ProductModel.fromJson(x))),
            dateCreated: json["dateCreated"],
            email: json["email"],
            orders: json["orders"] == null ? [] : List<ProductModel>.from(json["orders"]!.map((x) => ProductModel.fromJson(x))),
            phone: json["phone"],
            name: json["name"],
            custumerPaymentId: json["custumerPaymentId"],
            points: json["points"],
            wish: json["wish"] == null ? [] : List<ProductModel>.from(json["wish"]!.map((x) => ProductModel.fromJson(x))),
        );
    }

    Map<String, dynamic> toJson() => {
        "adresses": adresses.map((x) => x).toList(),
        "cart": cart.map((x) => x?.toJson()).toList(),
        "dateCreated": dateCreated,
        "email": email,
        "name": name,
        "custumerPaymentId": custumerPaymentId,
        "orders": orders.map((x) => x?.toJson()).toList(),
        "phone": phone,
        "points": points,
        "wish": wish.map((x) => x?.toJson()).toList(),
    };

}