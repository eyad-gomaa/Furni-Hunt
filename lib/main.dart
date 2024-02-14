import 'package:flutter/material.dart';
import 'package:furni_hunt/core/themes/dark_theme.dart';
import 'package:furni_hunt/core/utils/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: darkTheme,
    );
  }
}
