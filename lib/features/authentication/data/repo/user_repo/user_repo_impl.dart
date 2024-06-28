import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:furni_hunt/core/utils/failure/failure.dart';
import 'package:furni_hunt/features/authentication/data/model/user_model.dart';
import 'package:furni_hunt/features/authentication/data/repo/user_repo/user_repo.dart';

class UserRepoImpl implements UserRepo{
  @override
  Future<Either<UserModel, Failure>> fetchUserData() async{
    String userUid = FirebaseAuth.instance.currentUser!.uid;
try {
      final data = await FirebaseFirestore.instance
          .collection('users')
          .doc(userUid)
          .get();
      UserModel userData = UserModel.fromJson(data.data()!);
      return left(userData);
    } on FirebaseException catch (e) {
      print(e.code);
      return right(
          FirebaseFailure.fromFirebaseException(failureMessage: e.code));
    }
  }
}