// import 'package:boots_buy/features/auth/presentation/view_model/login_viewmodel/login_event.dart';
// import 'package:boots_buy/features/auth/presentation/view_model/login_viewmodel/login_state.dart';
// import 'package:boots_buy/features/auth/presentation/view_model/login_viewmodel/login_viewmodel.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class LoginScreen extends StatelessWidget {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController  emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   LoginScreen({super.key});
//
//   void _showSnackBar(BuildContext context, String message, {bool isError = false}) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         backgroundColor: isError ? Colors.red : Colors.green,
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: BlocBuilder<LoginViewModel, LoginState>(
//         builder: (context, state) {
//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             if (state.isSuccess) {
//               _showSnackBar(context, "Login Successful");
//             }
//             if (state.errorMessage != null) {
//               _showSnackBar(context, state.errorMessage!, isError: true);
//             }
//           });
//
//           return Container(
//             width: double.infinity,
//             height: double.infinity,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/img.png'),
//                 fit: BoxFit.fill,
//               ),
//             ),
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Login',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 175),
//
//                     /// Email Field
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.4),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: TextFormField(
//                         controller: emailController,
//                         style: TextStyle(color: Colors.black),
//                         decoration: InputDecoration(
//                           hintText: "Enter Email",
//                           hintStyle: TextStyle(color: Colors.black),
//                           prefixIcon: Icon(Icons.email, color: Colors.black),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//                         ),
//                         validator: (val) => val == null || val.isEmpty ? 'Enter Email' : null,
//                       ),
//                     ),
//
//                     SizedBox(height: 30),
//
//                     /// Password Field
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.4),
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: TextFormField(
//                         controller: passwordController,
//                         obscureText: true,
//                         style: TextStyle(color: Colors.black),
//                         decoration: InputDecoration(
//                           hintText: "Enter Password",
//                           hintStyle: TextStyle(color: Colors.black),
//                           prefixIcon: Icon(Icons.lock, color: Colors.black),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                           contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//                         ),
//                         validator: (val) => val == null || val.isEmpty ? 'Enter Password' : null,
//                       ),
//                     ),
//
//                     SizedBox(height: 30),
//
//                     /// Login Button
//                     SizedBox(
//                       width: double.infinity,
//                       height: 50,
//                       child: ElevatedButton(
//                         onPressed: state.isLoading
//                             ? null
//                             : () {
//                           if (_formKey.currentState!.validate()) {
//                             context.read<LoginViewModel>().add(
//                               LoginUserEvent(
//                                 email: emailController.text.trim(),
//                                 password: passwordController.text,
//                                 context: context,
//                               ),
//                             );
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor:Color(0xFFFFAB40),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         child: state.isLoading
//                             ? CircularProgressIndicator(color: Colors.white)
//                             : Text('Login', style: TextStyle(color: Colors.white)),
//                       ),
//                     ),
//
//                     SizedBox(height: 20),
//
//                     /// Sign Up Row
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text("Don't Have An Account?", style: TextStyle(color: Colors.black)),
//                         SizedBox(width: 10),
//                         ElevatedButton(
//                           onPressed: () {
//                             context.read<LoginViewModel>().add(NavigateToSignUpEvent(context: context));
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.white.withOpacity(0.7),
//                             foregroundColor: Colors.black,
//                           ),
//                           child: Text("Sign Up"),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }





////////////////////////////////
/////////////////////////////////
library;



import 'dart:async';
import 'dart:math';

import 'package:boots_buy/features/auth/presentation/view_model/login_viewmodel/login_event.dart';
import 'package:boots_buy/features/auth/presentation/view_model/login_viewmodel/login_state.dart';
import 'package:boots_buy/features/auth/presentation/view_model/login_viewmodel/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sensors_plus/sensors_plus.dart' as SensorPlus;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  StreamSubscription<SensorPlus.AccelerometerEvent>? _accelSub;
  static const double shakeThreshold = 2.8; // typical shake threshold
  bool _canDetectShake = true;

  bool _showReloadingOverlay = false;

  @override
  void initState() {
    super.initState();

    _accelSub = SensorPlus.accelerometerEvents.listen((SensorPlus.AccelerometerEvent event) {
      double gX = event.x / 9.8;
      double gY = event.y / 9.8;
      double gZ = event.z / 9.8;

      double gForce = sqrt(gX * gX + gY * gY + gZ * gZ);

      // Debug print to console
      print('gForce: $gForce');

      if (gForce > shakeThreshold && _canDetectShake) {
        _canDetectShake = false;
        _onShakeDetected();

        Future.delayed(Duration(seconds: 2), () {
          _canDetectShake = true;
        });
      }
    });
  }

  void _onShakeDetected() {
    print('Shake detected!');

    setState(() {
      emailController.clear();
      passwordController.clear();
      _formKey.currentState?.reset();
      _showReloadingOverlay = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Page reloaded due to shake!")),
    );

    // Hide the overlay after 1.5 seconds
    Future.delayed(Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() {
          _showReloadingOverlay = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _accelSub?.cancel();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BlocBuilder<LoginViewModel, LoginState>(
            builder: (context, state) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (state.isSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Login Successful")),
                  );
                }
                if (state.errorMessage != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage!),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              });

              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/img.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 175),

                        /// Email Field
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: emailController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: "Enter Email",
                              hintStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(Icons.email, color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                            ),
                            validator: (val) => val == null || val.isEmpty ? 'Enter Email' : null,
                          ),
                        ),

                        SizedBox(height: 30),

                        /// Password Field
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: "Enter Password",
                              hintStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(Icons.lock, color: Colors.black),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                            ),
                            validator: (val) => val == null || val.isEmpty ? 'Enter Password' : null,
                          ),
                        ),

                        SizedBox(height: 30),

                        /// Login Button
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: state.isLoading
                                ? null
                                : () {
                              if (_formKey.currentState!.validate()) {
                                context.read<LoginViewModel>().add(
                                  LoginUserEvent(
                                    email: emailController.text.trim(),
                                    password: passwordController.text,
                                    context: context,
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFFAB40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: state.isLoading
                                ? CircularProgressIndicator(color: Colors.white)
                                : Text('Login', style: TextStyle(color: Colors.white)),
                          ),
                        ),

                        SizedBox(height: 20),

                        /// Sign Up Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't Have An Account?", style: TextStyle(color: Colors.black)),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                context.read<LoginViewModel>().add(NavigateToSignUpEvent(context: context));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white.withOpacity(0.7),
                                foregroundColor: Colors.black,
                              ),
                              child: Text("Sign Up"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          /// Reloading overlay
          if (_showReloadingOverlay)
            Container(
              color: Colors.black54,
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Reloading...",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}



