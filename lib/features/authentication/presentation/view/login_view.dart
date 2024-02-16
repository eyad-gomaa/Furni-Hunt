import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt/features/authentication/data/repo/sign_in_repo/sign_in_repo_impl.dart';
import 'package:furni_hunt/features/authentication/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:furni_hunt/features/authentication/presentation/view/widget/login_view_body.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(repo: SignInRepoImpl()),
      child: Scaffold(
        body: SafeArea(child: LoginViewBody()),
      ),
    );
  }
}
