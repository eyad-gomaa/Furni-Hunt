part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpCubitInitial extends SignUpState {}
final class SignUpLoading extends SignUpState {}
final class SignUpSuccess extends SignUpState {
  final String successMessage;

  SignUpSuccess({required this.successMessage});
}
final class SignUpFailure extends SignUpState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}
