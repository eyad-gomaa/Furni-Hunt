import 'package:dartz/dartz.dart';

import '../../../../../core/utils/failure/firebase_failure.dart';

abstract class SignInRepo {
  Future<Either<String, Failure>> signInWithEmail(
      {required String email, required String password});

  Future<Either<String, Failure>> signInWithGoogle();
}
