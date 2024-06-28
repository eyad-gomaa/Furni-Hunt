import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:furni_hunt/core/utils/failure/failure.dart';
import 'package:furni_hunt/core/utils/stripe_service.dart';
import 'package:furni_hunt/features/authentication/data/model/user_model.dart';
import 'package:furni_hunt/features/authentication/data/repo/sign_up_repo/sign_up_repo.dart';
import 'package:furni_hunt/features/payment/data/model/customer_payment_input_model.dart';
import 'package:furni_hunt/features/payment/data/model/customer_payment_model.dart';

class SignUpRepoImpl implements SignUpRepo {
  @override
  Future<Either<String, Failure>> signUpWithEmail(
      {required String email, required String password}) async {
        
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return left("Sign Up Success");
    } on FirebaseAuthException catch (e) {
      return right(
          FirebaseFailure.fromFirebaseException(failureMessage: e.code));
    } catch (e) {
      return right(
          FirebaseFailure.fromFirebaseException(failureMessage: e.toString()));
    }
  }

  @override
  Future<Either<String, Failure>> createUser(
      {required UserModel userModel}) async {
    String? userUid = FirebaseAuth.instance.currentUser?.uid;
        StripeService stripeService = StripeService();

    if (userUid != null) {
      try {
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        CollectionReference users = firestore.collection('users');
        CustomerPaymentInputModel customerPaymentInputModel = CustomerPaymentInputModel(email: userModel.email!, name: userModel.name!);
        CustomerPaymentModel customerPaymentModel = await stripeService.createCustomer(customerPaymentInput: customerPaymentInputModel);
        userModel.custumerPaymentId = customerPaymentModel.id;
        users.doc(userUid).set(userModel.toJson());
        return left("Sign Up Success");
      } on Exception catch (e) {
        print(e.toString());
        return right(FirebaseFailure.fromFirebaseException(
            failureMessage: e.toString()));
      }
    }else{
      return right(FirebaseFailure.fromFirebaseException(
            failureMessage: "Sign Up failed"));
    }
  }
}
