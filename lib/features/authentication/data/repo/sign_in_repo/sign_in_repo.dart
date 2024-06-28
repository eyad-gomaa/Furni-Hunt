import 'package:dartz/dartz.dart';

import '../../../../../core/utils/failure/failure.dart';

abstract class SignInRepo {
  Future<Either<String, Failure>> signInWithEmail(
      {required String email, required String password});

  Future<Either<String, Failure>> signInWithGoogle();

  Future<Either<String,Failure>> googleSignInCreateUser();
}
