import 'package:dartz/dartz.dart';
import 'package:furni_hunt/core/utils/failure/failure.dart';
import 'package:furni_hunt/features/authentication/data/model/user_model.dart';

abstract class UserRepo{
Future<Either<UserModel, Failure>> fetchUserData();
}