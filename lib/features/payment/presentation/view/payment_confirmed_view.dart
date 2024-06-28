import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:furni_hunt/features/payment/presentation/view/widgets/payment_confirmed_view_body.dart';

class PaymentConfirmedView extends StatelessWidget {
  const PaymentConfirmedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const PaymentConfirmedViewBody());
  }
}