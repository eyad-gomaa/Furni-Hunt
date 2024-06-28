import 'package:bloc/bloc.dart';
import 'package:furni_hunt/core/utils/stripe_service.dart';
import 'package:furni_hunt/features/payment/data/model/payment_intent_input_model.dart';
import 'package:furni_hunt/features/payment/data/repos/payment_repo/payment_repo.dart';
import 'package:meta/meta.dart';
part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit({required this.repo}) : super(PaymentInitial());
  final PaymentRepo repo;
  makePayment({required PaymentIntentInputModel paymentIntentInput}) async {
    emit(PaymentLoading());
    var response =
        await repo.makePayment(paymentIntentInput: paymentIntentInput);
    response.fold(
      (l) => emit(PaymentFailure()),
      (r) => emit(PaymentSuccess()),
    );
  }

  @override
  void onChange(Change<PaymentState> change) {
    print(change);
    super.onChange(change);
  }
}
