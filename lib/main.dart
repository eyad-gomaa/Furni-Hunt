import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:furni_hunt/core/themes/dark_theme.dart';
import 'package:furni_hunt/core/utils/app_router.dart';
import 'package:furni_hunt/core/utils/stripe_keys.dart';
import 'package:furni_hunt/features/authentication/presentation/manager/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:furni_hunt/features/cart_and_fav/data/repo/cart_and_fav_repo/cart_and_fav_repo_impl.dart';
import 'package:furni_hunt/features/cart_and_fav/presentation/manager/cart_and_favourites_cubit/cart_and_favourites_cubit.dart';
import 'package:furni_hunt/features/payment/data/repos/checkout_repo/checkout_repo_impl.dart';
import 'package:furni_hunt/features/payment/presentation/manager/checkout_cubit/checkout_cubit.dart';
import 'firebase_options.dart';

void main() async {
  Stripe.publishableKey = StripeKeys.stripePublishableKey;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CartAndFavouritesCubit(repo: CartAndFavouritesRepoImpl())
                ..fetchWishAndCartProducts(),
        ),
        BlocProvider(
          create: (context) =>
              CheckoutCubit(repo: CheckoutRepoImpl())..getAddress(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: darkTheme,
      ),
    );
  }
}
