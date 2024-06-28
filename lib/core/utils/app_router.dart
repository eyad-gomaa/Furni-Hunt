import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:furni_hunt/features/authentication/presentation/view/login_view.dart';
import 'package:furni_hunt/features/authentication/presentation/view/sign_up_view.dart';
import 'package:furni_hunt/features/home/data/model/product_model.dart';
import 'package:furni_hunt/features/cart_and_fav/presentation/view/cart_view.dart';
import 'package:furni_hunt/features/home/presentation/view/category_view.dart';
import 'package:furni_hunt/features/cart_and_fav/presentation/view/favourites_view.dart';
import 'package:furni_hunt/features/home/presentation/view/home_view.dart';
import 'package:furni_hunt/features/home/presentation/view/product_view.dart';
import 'package:furni_hunt/features/onboarding/presentation/onboarding_view.dart';
import 'package:furni_hunt/features/payment/presentation/view/add_address_view.dart';
import 'package:furni_hunt/features/payment/presentation/view/payment_confirmed_view.dart';
import 'package:furni_hunt/features/payment/presentation/view/payment_view.dart';
import 'package:furni_hunt/features/splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

class RouterPath {
  static const String splashView = '/';
  static const String onboardingView = '/onboardingView';
  static const String signInView = '/signInView';
  static const String signUpView = '/signUpView';
  static const String homeView = '/homeView';
  static const String categoryView = '/categoryView';
  static const String productView = '/productView';
  static const String favouritesView = '/favouritesView';
  static const String cartView = '/cartView';
  static const String paymentView = '/paymentView';
  static const String addAdressView = '/addAdressView';
  static const String paymentConfirmedView = '/paymentConfirmedView';
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RouterPath.splashView,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashView();
      },
    ),
    GoRoute(
      path: RouterPath.onboardingView,
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardingView();
      },
    ),
    GoRoute(
      path: RouterPath.signInView,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginView();
      },
    ),
    GoRoute(
      path: RouterPath.signUpView,
      builder: (BuildContext context, GoRouterState state) {
        return const SignUpView();
      },
    ),
    GoRoute(
      path: RouterPath.homeView,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeView();
      },
    ),
    GoRoute(
      path: RouterPath.categoryView,
      builder: (BuildContext context, GoRouterState state) {
        return CategoryView(
          category: state.extra as String,
        );
      },
    ),
    GoRoute(
      path: RouterPath.productView,
      builder: (BuildContext context, GoRouterState state) {
        return ProductView(
          product: state.extra as ProductModel,
        );
      },
    ),
    GoRoute(
      path: RouterPath.favouritesView,
      builder: (BuildContext context, GoRouterState state) {
        return const FavouritesView();
      },
    ),
    GoRoute(
      path: RouterPath.cartView,
      builder: (BuildContext context, GoRouterState state) {
        return const CartView();
      },
    ),
    GoRoute(
      path: RouterPath.paymentView,
      builder: (BuildContext context, GoRouterState state) {
        return PaymentView(
          myCartList: state.extra as List<ProductModel>,
        );
      },
    ),
    GoRoute(
      path: RouterPath.addAdressView,
      builder: (BuildContext context, GoRouterState state) {
        return const AddAdressView();
      },
    ),
    GoRoute(
      path: RouterPath.paymentConfirmedView,
      builder: (BuildContext context, GoRouterState state) {
        return const PaymentConfirmedView();
      },
    ),
  ],
);
