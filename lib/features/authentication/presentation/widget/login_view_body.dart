import 'package:flutter/material.dart';
import 'package:furni_hunt/features/onboarding/presentation/widget/custom_button.dart';
import 'package:gap/gap.dart';

import '../../../../core/resources/color_manager.dart';
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Expanded(
        child: CustomScrollView(
          slivers: [
            const SliverGap(100),
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
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomButton(
                        text: "Login",
                        onTap: () {},
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot password?",
                                style: Theme.of(context).textTheme.bodySmall,
                              )),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Sign Up",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: ColorManager.secondary),
                              ))
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
