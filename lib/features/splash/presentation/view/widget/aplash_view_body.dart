import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Text("FurniHunt",style: Theme.of(context).textTheme.displayLarge,)
    );
  }
}