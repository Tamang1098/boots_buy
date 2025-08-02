// import 'package:boots_buy/app/service_locator/service_locator.dart';
// import 'package:boots_buy/features/home/presentation/view/cart_model.dart';
// import 'package:boots_buy/features/splash/presentation/view/splash_screenview.dart';
// import 'package:boots_buy/features/splash/presentation/view_model/splash_viewmodel.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider<CartModel>(create: (_) => CartModel()),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: BlocProvider<SplashViewModel>(
//           create: (_) => serviceLocator<SplashViewModel>(),
//           child: const SplashScreenView(),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:boots_buy/app/service_locator/service_locator.dart';
import 'package:boots_buy/features/splash/presentation/view/splash_screenview.dart';
import 'package:boots_buy/features/splash/presentation/view_model/splash_viewmodel.dart';
import 'package:boots_buy/features/home/presentation/view/cart_model.dart';
import 'package:boots_buy/features/home/presentation/view/order_model.dart';
import 'package:boots_buy/features/home/presentation/view/order_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartModel>(create: (_) => CartModel()),
        ChangeNotifierProvider<OrderModel>(create: (_) => OrderModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/orders': (context) => const OrderScreen(),
        },
        home: BlocProvider<SplashViewModel>(
          create: (_) => serviceLocator<SplashViewModel>(),
          child: const SplashScreenView(),
        ),
      ),
    );
  }
}
