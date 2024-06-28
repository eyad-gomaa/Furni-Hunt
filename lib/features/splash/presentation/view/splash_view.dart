import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furni_hunt/core/resources/color_manager.dart';
import 'package:furni_hunt/core/utils/app_router.dart';
import 'package:furni_hunt/features/splash/presentation/view/widget/aplash_view_body.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}
class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),(){
      if(FirebaseAuth.instance.currentUser == null){
        GoRouter.of(context).pushReplacement(RouterPath.onboardingView);
      }else{
        GoRouter.of(context).pushReplacement(RouterPath.homeView);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SplashViewBody(),
    );
  }
}