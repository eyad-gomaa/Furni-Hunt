import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt/features/authentication/presentation/model/sign_in_cubit.dart';
import 'package:furni_hunt/features/authentication/presentation/widget/auth_bottom_options.dart';
import 'package:furni_hunt/features/authentication/presentation/widget/custom_snack_bar.dart';
import 'package:furni_hunt/features/authentication/presentation/widget/over_app_loading_indicator.dart';
import 'package:furni_hunt/features/onboarding/presentation/widget/custom_button.dart';
import 'package:gap/gap.dart';
import 'custom_login_form.dart';
import 'external_auth_buttons.dart';
import 'login_welcome_text.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          customSnackBar(
              context: context,
              message: state.successMessage,
              color: Colors.green);
        } else if (state is SignInFailure) {
          customSnackBar(
              context: context, message: state.errMessage, color: Colors.red);
        }
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomScrollView(
              slivers: [
                const SliverGap(20),
                const SliverToBoxAdapter(
                  child: LoginWelcomeText(),
                ),
                const SliverGap(50),
                const SliverToBoxAdapter(
                  child: ExternalAuthButtons(),
                ),
                const SliverGap(28),
                SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      "or",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
                const SliverGap(33),
                SliverToBoxAdapter(
                  child: CustomLoginForm(
                    passwordController: passwordController,
                    emailController: emailController,
                    formKey: formKey,
                  ),
                ),
                const SliverGap(20),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomButton(
                            text: "Login",
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<SignInCubit>(context)
                                    .signInWithEmail(
                                        email: emailController.value.text,
                                        password:
                                            passwordController.value.text);
                              }
                            },
                          ),
                          const AuthButtomOptions()
                        ],
                      )),
                ),
              ],
            ),
          ),
          BlocBuilder<SignInCubit, SignInState>(
            builder: (context, state) {
              if (state is SignInLoading) {
                return const OverAppLoadingIndicator();
              } else {
                return const SizedBox
                    .shrink(); // Hide indicator when not loading
              }
            },
          ),
        ],
      ),
    );
  }
}
