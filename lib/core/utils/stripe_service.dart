import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:furni_hunt/core/utils/api_service.dart';
import 'package:furni_hunt/core/utils/stripe_keys.dart';
import 'package:furni_hunt/features/authentication/data/model/user_model.dart';
import 'package:furni_hunt/features/payment/data/model/customer_payment_input_model.dart';
import 'package:furni_hunt/features/payment/data/model/customer_payment_model.dart';
import 'package:furni_hunt/features/payment/data/model/ephemeral_key_model.dart';
import 'package:furni_hunt/features/payment/data/model/payment_intent_input_model.dart';
import 'package:furni_hunt/features/payment/data/model/payment_intent_model.dart';

class StripeService {
  ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
      {required PaymentIntentInputModel paymentIntentInput,required String customerId}) async {
        paymentIntentInput.customerId = customerId;
    var response = await apiService.post(
        body: paymentIntentInput.toJson(),
        url: "https://api.stripe.com/v1/payment_intents",
        token: StripeKeys.stripeSecretKey);
    PaymentIntentModel paymentIntentModel =
        PaymentIntentModel.fromJson(response.data);
        print("payment intent created");
    return paymentIntentModel;
  }

  Future<CustomerPaymentModel> createCustomer(
      {required CustomerPaymentInputModel customerPaymentInput}) async {
    var response = await apiService.post(
        body: customerPaymentInput,
        url: "https://api.stripe.com/v1/customers",
        token: StripeKeys.stripeSecretKey);
    CustomerPaymentModel customerPaymentModel =
        CustomerPaymentModel.fromJson(response.data);
    return customerPaymentModel;
  }
  Future<String> getCustomerId()async{
    String userUid = FirebaseAuth.instance.currentUser!.uid;

      final data = await FirebaseFirestore.instance
          .collection('users')
          .doc(userUid)
          .get();
      UserModel userData = UserModel.fromJson(data.data()!);
      print("customer id = ${userData.custumerPaymentId!}");
      return userData.custumerPaymentId!;
  }
  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
        body: {"customer": customerId
},
        url: "https://api.stripe.com/v1/ephemeral_keys",
        token: StripeKeys.stripeSecretKey,
        headers: {
          "Authorization" : "Bearer ${StripeKeys.stripeSecretKey}",
          "Stripe-Version" : "2023-10-16"
        },
        );
    EphemeralKeyModel ephemeralKeyModel =
        EphemeralKeyModel.fromJson(response.data);
        print("ephemeralKey = ${ephemeralKeyModel.secret}");
    return ephemeralKeyModel;
  }

  Future<void> initPaymentSheet(
      {required String paymentIntentClientSecret,
      required String customerEphemeralKeySecret,
      required String customerId}) async {
    try {
      // 2. initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: 'FurniHunt',
          paymentIntentClientSecret: paymentIntentClientSecret,
          customerEphemeralKeySecret: customerEphemeralKeySecret,
          customerId: customerId,
        ),
      );
      print("initPaymentSheet");
    } catch (e) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Error: $e')),
      // );
      rethrow;
    }
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInput}) async {
        String customerId = await getCustomerId();
    PaymentIntentModel paymentIntentModel =
        await createPaymentIntent(paymentIntentInput: paymentIntentInput, customerId: customerId);
        
    EphemeralKeyModel ephemeralKeyModel =
        await createEphemeralKey(customerId: customerId);
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!,
        customerEphemeralKeySecret: ephemeralKeyModel.secret!,
        customerId: customerId);
    await displayPaymentSheet();
  }
}
