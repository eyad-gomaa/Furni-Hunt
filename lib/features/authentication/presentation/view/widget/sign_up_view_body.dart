
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt/features/authentication/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:furni_hunt/features/authentication/presentation/view/widget/over_app_loading_indicator.dart';
import 'package:furni_hunt/features/authentication/presentation/view/widget/sign_up_custom_scroll_view.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SignUpCustomScrollView(),
        ),
        BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) {
            if (state is SignUpLoading) {
              return const OverAppLoadingIndicator();
            } else {
              return const SizedBox.shrink();
            }
          },
        )
      ],
    );
  }
}


