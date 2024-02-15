import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt/features/authentication/presentation/widget/login_view_body.dart';

import '../data/repo/sign_in_repo/sign_in_repo_impl.dart';
import 'model/sign_in_cubit.dart';

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
