import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt/core/resources/color_manager.dart';
import 'package:furni_hunt/core/utils/app_router.dart';
import 'package:furni_hunt/features/authentication/presentation/view/widget/custom_snack_bar.dart';
import 'package:furni_hunt/features/home/data/model/product_model.dart';
import 'package:furni_hunt/features/payment/data/repos/payment_repo/payment_repo_impl.dart';
import 'package:furni_hunt/features/payment/presentation/manager/payment_cubit/payment_cubit.dart';
import 'package:furni_hunt/features/payment/presentation/view/widgets/payment_view_body.dart';
import 'package:go_router/go_router.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key, required this.myCartList});
  final List<ProductModel> myCartList;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(repo: PaymentRepoImpl()),
      child: BlocConsumer<PaymentCubit, PaymentState>(
        listener: (context, state) {
          if (state is PaymentLoading) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => const Dialog(
                backgroundColor: Colors.transparent,
                child: Center(child: CircularProgressIndicator()),
              ),
            );
          } else if (state is PaymentFailure) {
            customSnackBar(
                context: context, message: "payment failed", color: Colors.red);
            context.pop();
            context.pop();
          } else if (state is PaymentSuccess) {
            context.pop();
            GoRouter.of(context).push(RouterPath.paymentConfirmedView);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Check Out",
                  style: Theme.of(context).textTheme.displaySmall),
              centerTitle: true,
            ),
            body: PaymentViewBody(
              myCartList: myCartList,
            ),
          );
        },
      ),
    );
  }
}
