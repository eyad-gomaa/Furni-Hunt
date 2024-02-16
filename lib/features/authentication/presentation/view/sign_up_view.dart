import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt/features/authentication/data/repo/sign_up_repo/sign_up_repo_impl.dart';
import 'package:furni_hunt/features/authentication/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:furni_hunt/features/authentication/presentation/view/widget/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (context) => SignInCubit(repo: SignInRepoImpl()),
        // ),
        BlocProvider(
          create: (context) => SignUpCubit(SignUpRepoImpl()),
        ),
      ],
      child: const Scaffold(
          body: SafeArea(
        child: SignUpViewBody(),
      )),
    );
  }
}
