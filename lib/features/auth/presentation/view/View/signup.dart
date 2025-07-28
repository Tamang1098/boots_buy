// import 'package:boots_buy/features/auth/presentation/view_model/signup_viewmodel/signup_event.dart';
// import 'package:boots_buy/features/auth/presentation/view_model/signup_viewmodel/signup_state.dart';
// import 'package:boots_buy/features/auth/presentation/view_model/signup_viewmodel/signup_viewmodel.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});
//
//   @override
//   _SignupScreenState createState() => _SignupScreenState();
// }
//
// class _SignupScreenState extends State<SignupScreen> {
//   final _formKey = GlobalKey<FormState>();
//
//   final emailController = TextEditingController();
//   final usernameController = TextEditingController();
//   final passwordController = TextEditingController();
//   final addressController = TextEditingController();  // Fixed typo here
//   final mobilenumberController = TextEditingController();
//
//   @override
//   void dispose() {
//     // Dispose controllers to avoid memory leaks
//     emailController.dispose();
//     usernameController.dispose();
//     passwordController.dispose();
//     addressController.dispose();
//     mobilenumberController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: BlocBuilder<SignupViewModel, SignupState>(
//         builder: (context, state) {
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
//                       'Sign Up',
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     const SizedBox(height: 30),
//
//                     /// Username
//                     _buildStyledTextField(
//                       controller: usernameController,
//                       hintText: "Enter Username",
//                       icon: Icons.person,
//                       validator: (val) =>
//                       val == null || val.isEmpty ? 'Enter username' : null,
//                     ),
//
//                     const SizedBox(height: 20),
//
//                     /// Email
//                     _buildStyledTextField(
//                       controller: emailController,
//                       hintText: "Enter Email",
//                       icon: Icons.email,
//                       keyboardType: TextInputType.emailAddress,
//                       validator: (val) =>
//                       val == null || val.isEmpty ? 'Enter email' : null,
//                     ),
//
//                     const SizedBox(height: 20),
//
//                     /// Password
//                     _buildStyledTextField(
//                       controller: passwordController,
//                       hintText: "Enter Password",
//                       icon: Icons.lock,
//                       obscureText: true,
//                       validator: (val) => val == null || val.length < 6
//                           ? 'Password requires at least 6 characters'
//                           : null,
//                     ),
//
//                     const SizedBox(height: 30),
//
//                     /// Address
//                     _buildStyledTextField(
//                       controller: addressController,
//                       hintText: "Enter Address",
//                       icon: Icons.location_city,
//                       obscureText: false, // fixed
//                       validator: (val) =>
//                       val == null || val.isEmpty ? 'Enter address' : null,
//                     ),
//
//                     const SizedBox(height: 30),
//
//                     /// Mobile Number
//                     _buildStyledTextField(
//                       controller: mobilenumberController,
//                       hintText: "Enter Mobile Number",
//                       icon: Icons.contact_phone_outlined,
//                       keyboardType: TextInputType.phone,
//                       obscureText: false, // fixed
//                       validator: (val) =>
//                       val == null || val.isEmpty ? 'Enter mobile number' : null,
//                     ),
//
//                     const SizedBox(height: 30),
//
//                     /// Signup Button
//                     SizedBox(
//                       width: double.infinity,
//                       height: 50,
//                       child: ElevatedButton(
//                         onPressed: state.isLoading
//                             ? null
//                             : () {
//                           if (_formKey.currentState!.validate()) {
//                             context.read<SignupViewModel>().add(
//                               SignupButtonPressed(
//                                 email: emailController.text.trim(),
//                                 username: usernameController.text.trim(),
//                                 password: passwordController.text,
//                                 address: addressController.text.trim(),
//                                 mobilenumber: mobilenumberController.text.trim(),
//                                 context: context,
//                               ),
//                             );
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color(0xFFFFAB40),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         child: state.isLoading
//                             ? CircularProgressIndicator(color: Colors.white)
//                             : Text("Sign Up", style: TextStyle(color: Colors.white)),
//                       ),
//                     ),
//
//                     const SizedBox(height: 20),
//
//                     /// Login Navigation
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text("Already have an account?", style: TextStyle(color: Colors.black)),
//                         const SizedBox(width: 10),
//                         ElevatedButton(
//                           onPressed: () => Navigator.pop(context),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.white.withOpacity(0.7),
//                             foregroundColor: Colors.black,
//                           ),
//                           child: Text("Login"),
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
//
//   /// Styled Input Field builder
//   Widget _buildStyledTextField({
//     required TextEditingController controller,
//     required String hintText,
//     required IconData icon,
//     TextInputType keyboardType = TextInputType.text,
//     bool obscureText = false,
//     String? Function(String?)? validator,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.4),
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: Colors.white54),
//       ),
//       child: TextFormField(
//         controller: controller,
//         keyboardType: keyboardType,
//         obscureText: obscureText,
//         style: const TextStyle(color: Colors.black),
//         decoration: InputDecoration(
//           hintText: hintText,
//           hintStyle: const TextStyle(color: Colors.black),
//           prefixIcon: Icon(icon, color: Colors.black),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//         ),
//         validator: validator,
//       ),
//     );
//   }
// }



import 'dart:async';
import 'dart:math';

import 'package:boots_buy/features/auth/presentation/view_model/signup_viewmodel/signup_event.dart';
import 'package:boots_buy/features/auth/presentation/view_model/signup_viewmodel/signup_state.dart';
import 'package:boots_buy/features/auth/presentation/view_model/signup_viewmodel/signup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sensors_plus/sensors_plus.dart' as SensorPlus;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final mobilenumberController = TextEditingController();

  StreamSubscription<SensorPlus.AccelerometerEvent>? _accelSub;
  static const double shakeThreshold = 2.8;
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
      usernameController.clear();
      passwordController.clear();
      addressController.clear();
      mobilenumberController.clear();
      _formKey.currentState?.reset();
      _showReloadingOverlay = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Page reloaded due to shake!")),
    );

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
    _accelSub?.cancel(); // Dispose sensor stream
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    addressController.dispose();
    mobilenumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          BlocBuilder<SignupViewModel, SignupState>(
            builder: (context, state) {
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
                          'Sign Up',
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        const SizedBox(height: 30),

                        _buildStyledTextField(
                          controller: usernameController,
                          hintText: "Enter Username",
                          icon: Icons.person,
                          validator: (val) => val == null || val.isEmpty ? 'Enter username' : null,
                        ),
                        const SizedBox(height: 20),

                        _buildStyledTextField(
                          controller: emailController,
                          hintText: "Enter Email",
                          icon: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) => val == null || val.isEmpty ? 'Enter email' : null,
                        ),
                        const SizedBox(height: 20),

                        _buildStyledTextField(
                          controller: passwordController,
                          hintText: "Enter Password",
                          icon: Icons.lock,
                          obscureText: true,
                          validator: (val) => val == null || val.length < 6
                              ? 'Password requires at least 6 characters'
                              : null,
                        ),
                        const SizedBox(height: 30),

                        _buildStyledTextField(
                          controller: addressController,
                          hintText: "Enter Address",
                          icon: Icons.location_city,
                          validator: (val) => val == null || val.isEmpty ? 'Enter address' : null,
                        ),
                        const SizedBox(height: 30),

                        _buildStyledTextField(
                          controller: mobilenumberController,
                          hintText: "Enter Mobile Number",
                          icon: Icons.contact_phone_outlined,
                          keyboardType: TextInputType.phone,
                          validator: (val) => val == null || val.isEmpty ? 'Enter mobile number' : null,
                        ),
                        const SizedBox(height: 30),

                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: state.isLoading
                                ? null
                                : () {
                              if (_formKey.currentState!.validate()) {
                                context.read<SignupViewModel>().add(
                                  SignupButtonPressed(
                                    email: emailController.text.trim(),
                                    username: usernameController.text.trim(),
                                    password: passwordController.text,
                                    address: addressController.text.trim(),
                                    mobilenumber: mobilenumberController.text.trim(),
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
                                : Text("Sign Up", style: TextStyle(color: Colors.white)),
                          ),
                        ),

                        const SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?", style: TextStyle(color: Colors.black)),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white.withOpacity(0.7),
                                foregroundColor: Colors.black,
                              ),
                              child: Text("Login"),
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

          /// Overlay when shake is detected
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

  Widget _buildStyledTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white54),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black),
          prefixIcon: Icon(icon, color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        ),
        validator: validator,
      ),
    );
  }
}
