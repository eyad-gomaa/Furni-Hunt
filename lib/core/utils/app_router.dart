import 'package:flutter/material.dart';
import 'package:furni_hunt/features/authentication/presentation/login_view.dart';
import 'package:furni_hunt/features/onboarding/presentation/onboarding_view.dart';
import 'package:go_router/go_router.dart';

class RouterPath {
  static const String onboardingView = '/';
  // static const String genderView = '/gender';
  // static const String getStartedView = '/getStarted';
  // static const String signUpView = '/signUpView';
  static const String loginView = '/loginView';
  // static const String homeView = '/homeView';
  // static const String detailsView = '/detailsView';
  // static const String brandView = '/brandView';
  // static const String favouriteView = '/favouriteView';
  // static const String cartView = '/cartView';
  // static const String selectScreen = '/selectScreen';
  // static const String paymentView = '/paymentView';
  // static const String orderConfirmedView = '/orderConfirmedView';
  // static const String addCardScreen = '/addCardScreen';
  // static const String forgotPasswordView = '/forgotPasswordView';
  // static const String addressView = '/addressView';
  // static const String verificationCodeView = '/verificationCodeView';
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RouterPath.onboardingView,
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardingView();
      },
    ),
    GoRoute(
      path: RouterPath.loginView,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginView();
      },
    ),
  ],
);
