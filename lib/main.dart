// import 'package:boots_buy/app/app.dart';
// import 'package:boots_buy/app/service_locator/service_locator.dart';
// import 'package:boots_buy/core/network/hive_service.dart';
// import 'package:flutter/material.dart';
//
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await HiveService().init(); // Required
//
//   await setupServiceLocator();
//   runApp(const App());
// }



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:boots_buy/core/network/hive_service.dart';
import 'package:boots_buy/app/service_locator/service_locator.dart';
import 'package:boots_buy/app/app.dart';
import 'package:boots_buy/features/home/presentation/view/cart_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveService().init(); // Hive initialization

  await setupServiceLocator();

  runApp(
    ChangeNotifierProvider(
      create: (_) => CartModel(),
      child: const App(),
    ),
  );
}
