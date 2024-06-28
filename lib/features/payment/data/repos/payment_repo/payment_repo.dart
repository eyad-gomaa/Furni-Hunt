import 'package:dartz/dartz.dart';
import 'package:furni_hunt/core/utils/failure/failure.dart';
import 'package:furni_hunt/features/payment/data/model/payment_intent_input_model.dart';

abstract class PaymentRepo{
Future<Either<Failure, void>> makePayment({required PaymentIntentInputModel paymentIntentInput});
}