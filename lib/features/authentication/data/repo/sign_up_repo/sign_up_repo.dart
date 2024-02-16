import 'package:dartz/dartz.dart';
import 'package:furni_hunt/core/utils/failure/firebase_failure.dart';
import 'package:furni_hunt/features/authentication/data/model/user_model.dart';

abstract class SignUpRepo{
  Future<Either<String,Failure>> signUpWithEmail({required String email, required String password});
  Future<Either<String,Failure>> createUser({required UserModel userModel});
}