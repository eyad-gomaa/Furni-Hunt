part of 'sign_in_cubit.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final String successMessage;

  SignInSuccess({required this.successMessage});
}

class SignInFailure extends SignInState {
  final String errMessage;

  SignInFailure({required this.errMessage});
}
