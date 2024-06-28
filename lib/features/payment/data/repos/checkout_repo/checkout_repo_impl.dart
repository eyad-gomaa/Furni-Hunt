import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:furni_hunt/features/payment/data/model/address_model.dart';
import 'package:furni_hunt/features/payment/data/repos/checkout_repo/checkout_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckoutRepoImpl implements CheckoutRepo {
  @override
  Future<Either<AddressModel, Null>> getAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? address = prefs.getString("address");
    if (address != null) {
      AddressModel addressModel = AddressModel.fromJson(jsonDecode(address));
      return left(addressModel);
    } else {
      return right(null);
    }
  }

  @override
  deleteAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("address");
  }

  @override
  addAddress({required AddressModel addressModel}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String addressEncoded = jsonEncode(addressModel.toJson());
    await prefs.setString("address", addressEncoded);
  }
}
