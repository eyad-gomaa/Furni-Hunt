import 'package:dartz/dartz.dart';
import 'package:furni_hunt/features/payment/data/model/address_model.dart';

abstract class CheckoutRepo {
  Future<Either<AddressModel, Null>> getAddress();
  addAddress({required AddressModel addressModel});
  deleteAddress();
}
