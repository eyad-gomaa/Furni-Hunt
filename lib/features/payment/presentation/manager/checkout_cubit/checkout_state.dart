part of 'checkout_cubit.dart';

@immutable
sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}
final class GetAddressSuccess extends CheckoutState {
  final AddressModel addressModel;

  GetAddressSuccess({required this.addressModel});
}
final class GetAddressFailure extends CheckoutState {}
final class ReloadAddress extends CheckoutState {}
