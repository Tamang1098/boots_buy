import 'dart:async';

import 'package:boots_buy/view/login_screenview.dart';
import 'package:flutter/material.dart';

class SplashScreenview extends StatefulWidget {
  const SplashScreenview({super.key});

  @override
  State<SplashScreenview> createState() => _SplashScreenviewState();
}

class _SplashScreenviewState extends State<SplashScreenview> {

  @override
  void initState() {
  Timer(Duration(seconds: 2),(){
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreenview(),));
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash_screen.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
