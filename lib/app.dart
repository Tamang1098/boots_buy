import 'package:boots_buy/view/splash_screenview.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:SplashScreenview (),
      debugShowCheckedModeBanner: false,
    );
  }
}
