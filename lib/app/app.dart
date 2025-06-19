import 'package:boots_buy/app/service_locator/service_locator.dart';
import 'package:boots_buy/features/splash/presentation/view/splash_screenview.dart';
import 'package:boots_buy/features/splash/presentation/view_model/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<SplashViewModel>(
        create: (_) => serviceLocator<SplashViewModel>(),
        child: SplashScreenView(),
      ),
    );
  }
}