import 'package:dartz/dartz.dart';
import 'package:furni_hunt/core/utils/failure/failure.dart';
import 'package:furni_hunt/core/utils/stripe_service.dart';
import 'package:furni_hunt/features/payment/data/model/payment_intent_input_model.dart';
import 'package:furni_hunt/features/payment/data/repos/payment_repo/payment_repo.dart';

class PaymentRepoImpl implements PaymentRepo {
  final StripeService stripeService = StripeService();

  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInput}) async {
    try {
      await stripeService.makePayment(paymentIntentInput: paymentIntentInput);
      print("payment confirmed");
      return right(null);
    } on Exception catch (e) {
      return left(ServerFailure(failureMessage: e.toString()));
    }
  }
}
