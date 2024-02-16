import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name;
  final String email;
  final String phone;
  final String points;
  final Timestamp dateCreated;
  final List adresses;
  final List cart;
  final List wish;
  final List orders;

  UserModel(
      {required this.name,
      required this.email,
      required this.phone,
      required this.points,
      required this.dateCreated,
      required this.adresses,
      required this.cart,
      required this.wish,
      required this.orders});


  factory UserModel.fromJson(Map<String, dynamic>json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      points: json['points'],
      dateCreated: json['dateCreated'],
      adresses: json['adresses'],
      cart: json['cart'],
      wish: json['wish'],
      orders: json['orders'],
    );
  }

  Map<String,dynamic>toJson(){
    return {
      'name' : name,
      'email' : email,
      'phone' : phone,
      'points' : points,
      'dateCreated' : dateCreated,
      'adresses' : adresses,
      'cart' : cart,
      'wish' : wish,
      'orders' : orders,
    };
  }
}
