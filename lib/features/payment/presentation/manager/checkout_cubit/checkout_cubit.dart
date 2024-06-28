import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt/features/payment/data/model/address_model.dart';
import 'package:furni_hunt/features/payment/data/repos/checkout_repo/checkout_repo.dart';
import 'package:meta/meta.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit({required this.repo}) : super(CheckoutInitial());
  final CheckoutRepo repo;

  getAddress() async {
    var response = await repo.getAddress();
    response.fold((l) {
      emit(GetAddressSuccess(addressModel: l));
    }, (r) {
      emit(GetAddressFailure());
    });
  }

  deleteAddress() {
    repo.deleteAddress();
    getAddress();
  }

  addAddress({required AddressModel addressModel}) async {
    repo.addAddress(addressModel: addressModel);
    getAddress();
  }
}
