import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:furni_hunt/core/utils/failure/firebase_failure.dart';
import 'package:furni_hunt/features/authentication/data/model/user_model.dart';
import 'package:furni_hunt/features/authentication/data/repo/sign_in_repo/sign_in_repo.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInRepoImpl implements SignInRepo {
  @override
  Future<Either<String, Failure>> signInWithEmail(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return left("Sign In Success");
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return right(
          FirebaseFailure.fromFirebaseException(failureMessage: e.code));
    } catch (e) {
      print(e.toString());
      return right(
          FirebaseFailure.fromFirebaseException(failureMessage: e.toString()));
    }
  }

  @override
  Future<Either<String, Failure>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);

      return left("login Success");
    } on FirebaseException catch (e) {
      return right(
          FirebaseFailure.fromFirebaseException(failureMessage: e.code));
    } catch (e) {
      return right(
          FirebaseFailure.fromFirebaseException(failureMessage: e.toString()));
    }
  }

  @override
  Future<Either<String, Failure>> googleSignInCreateUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    String? userUid = user?.uid;
    String? name = user?.displayName;
    String? email = user?.email;
    UserModel userModel = UserModel(
        name: name!,
        email: email!,
        phone: null,
        points: null,
        dateCreated: Timestamp.now(),
        adresses: [],
        cart: [],
        wish: [],
        orders: []);
    if (userUid != null) {
      try {
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        CollectionReference users = firestore.collection('users');
        DocumentSnapshot<Object?> doc = await users.doc(userUid).get();
        if (doc.exists == false) {
          await users.doc(userUid).set(userModel.toJson());
        }
        return left("Sign In Success");
      } on Exception catch (e) {
        print(e.toString());
        return right(FirebaseFailure.fromFirebaseException(
            failureMessage: e.toString()));
      }
    } else {
      return right(FirebaseFailure.fromFirebaseException(
          failureMessage: "Sign In failed"));
    }
  }
}
