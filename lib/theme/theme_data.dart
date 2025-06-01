import 'package:flutter/material.dart';

ThemeData getApplicationTheme(){
  return ThemeData(
    useMaterial3: false,
    primarySwatch: Colors.teal,
    scaffoldBackgroundColor: Colors.grey[200],
    fontFamily: 'OpenSans Regular',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: 'Opensans Regular'),
        backgroundColor: Colors.orangeAccent[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),

        ),

      ),
    ),


  );
}