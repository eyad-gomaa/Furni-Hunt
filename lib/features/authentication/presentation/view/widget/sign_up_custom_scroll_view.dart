import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furni_hunt/core/utils/app_router.dart';
import 'package:furni_hunt/features/authentication/data/model/user_model.dart';
import 'package:furni_hunt/features/authentication/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:furni_hunt/features/authentication/presentation/view/widget/auth_bottom_options.dart';
import 'package:furni_hunt/features/authentication/presentation/view/widget/custom_snack_bar.dart';
import 'package:furni_hunt/features/authentication/presentation/view/widget/login_welcome_text.dart';
import 'package:furni_hunt/features/authentication/presentation/view/widget/sign_up_form.dart';
import 'package:furni_hunt/features/onboarding/presentation/widget/custom_button.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SignUpCustomScrollView extends StatefulWidget {
  const SignUpCustomScrollView({super.key});

  @override
  State<SignUpCustomScrollView> createState() => _SignUpCustomScrollViewState();
}

class _SignUpCustomScrollViewState extends State<SignUpCustomScrollView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberCodeController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverGap(20),
        const SliverToBoxAdapter(
          child: LoginWelcomeText(),
        ),
        const SliverGap(30),
        // SliverToBoxAdapter(
        //   child: BlocListener<SignInCubit, SignInState>(
        //     listener: (context, state) {
        //       if (state is SignInSuccess) {
        //         customSnackBar(
        //             context: context,
        //             message: state.successMessage,
        //             color: Colors.green);
        //       } else if (state is SignInFailure) {
        //         customSnackBar(
        //             context: context,
        //             message: state.errMessage,
        //             color: Colors.red);
        //       }
        //     },
        //     child: ExternalAuthButtons(),
        //   ),
        // ),
        // const SliverGap(10),
        // SliverToBoxAdapter(
        //   child: Center(
        //     child: Text(
        //       "or",
        //       style: Theme.of(context).textTheme.bodySmall,
        //     ),
        //   ),
        // ),
        SliverToBoxAdapter(
          child: CustomSignUpForm(
            emailController: _emailController,
            phoneNumberCodeController: _phoneNumberCodeController,
            phoneNumberController: _phoneNumberController,
            passwordController: _passwordController,
            formKey: formKey,
            nameController: _nameController,
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
                  BlocConsumer<SignUpCubit, SignUpState>(
                    listener: (context, state) {
                      if (state is SignUpSuccess) {
                        customSnackBar(
                            context: context,
                            message: state.successMessage,
                            color: Colors.green);
                            GoRouter.of(context).pushReplacement(RouterPath.homeView);
                      } else if (state is SignUpFailure) {
                        customSnackBar(
                            context: context,
                            message: state.errMessage,
                            color: Colors.red);
                      }
                    },
                    builder: (context, state) {
                      return CustomButton(
                        isLoading: state is SignUpLoading ? true : false,
                        text: "Sign Up",
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<SignUpCubit>(context)
                                .signUpWithEmail(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    userModel: UserModel(
                                      name: _nameController.text,
                                      email: _emailController.text,
                                      phone:
                                          "${_phoneNumberCodeController.text}${_phoneNumberController.text}",
                                      points: 11,
                                      dateCreated: Timestamp.now(),
                                      adresses: [],
                                      cart: [],
                                      wish: [],
                                      orders: [],
                                    ));
                          }
                        },
                      );
                    },
                  ),
                  AuthButtomOptions(
                    leftText: 'Already have an account?',
                    rightText: 'Login',
                    leftOnPressed: () {
                      GoRouter.of(context).push(RouterPath.signInView);
                    },
                    rightOnPressed: () {
                      GoRouter.of(context).push(RouterPath.signUpView);
                    },
                  )
                ],
              )),
        ),
      ],
    );
  }
}
