import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../../view_model/login_viewmodel/login_event.dart';
import '../../view_model/login_viewmodel/login_state.dart';
import '../../view_model/login_viewmodel/login_viewmodel.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FlipLockLoginScreen(),
  ));
}

class FlipLockLoginScreen extends StatefulWidget {
  const FlipLockLoginScreen({super.key});

  @override
  State<FlipLockLoginScreen> createState() => _FlipLockLoginScreenState();
}

class _FlipLockLoginScreenState extends State<FlipLockLoginScreen> {
  bool _showLoginForm = true; // Show form first time
  bool _showUnlockButton = false;
  bool _showReloadingOverlay = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  StreamSubscription<AccelerometerEvent>? _accelSub;
  static const double shakeThreshold = 2.8;
  bool _canDetectShake = true;

  @override
  void initState() {
    super.initState();

    _accelSub = accelerometerEvents.listen((event) {
      double gX = event.x / 9.8;
      double gY = event.y / 9.8;
      double gZ = event.z / 9.8;
      double gForce = sqrt(gX * gX + gY * gY + gZ * gZ);

      // Flip face down to lock
      if (event.z < -9 && _showLoginForm) {
        setState(() {
          _showLoginForm = false;
          _showUnlockButton = false;
        });
      }

      // Flip face up to show unlock
      if (event.z > 9 && !_showLoginForm && !_showUnlockButton) {
        setState(() {
          _showUnlockButton = true;
        });
      }

      // Shake to clear when form is visible
      if (_showLoginForm && gForce > shakeThreshold && _canDetectShake) {
        _canDetectShake = false;
        _onShakeDetected();

        Future.delayed(const Duration(seconds: 2), () {
          _canDetectShake = true;
        });
      }
    });
  }

  void _onShakeDetected() {
    setState(() {
      emailController.clear();
      passwordController.clear();
      _formKey.currentState?.reset();
      _showReloadingOverlay = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Form cleared by shaking phone!")),
    );

    Future.delayed(const Duration(milliseconds: 1500), () {
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
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          if (_showLoginForm)
            BlocBuilder<LoginViewModel, LoginState>(
              builder: (context, state) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
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
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/img.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 150),

                          _buildTextField(
                            controller: emailController,
                            hint: "Enter Email",
                            icon: Icons.email,
                            validator: (val) => val == null || val.isEmpty ? 'Enter Email' : null,
                          ),

                          const SizedBox(height: 30),

                          _buildTextField(
                            controller: passwordController,
                            hint: "Enter Password",
                            icon: Icons.lock,
                            obscure: true,
                            validator: (val) => val == null || val.isEmpty ? 'Enter Password' : null,
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
                                backgroundColor: const Color(0xFFFFAB40),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: state.isLoading
                                  ? const CircularProgressIndicator(color: Colors.white)
                                  : const Text('Login', style: TextStyle(color: Colors.white)),
                            ),
                          ),

                          const SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't Have An Account?",
                                  style: TextStyle(color: Colors.black)),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<LoginViewModel>().add(
                                    NavigateToSignUpEvent(context: context),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white.withOpacity(0.7),
                                  foregroundColor: Colors.black,
                                ),
                                child: const Text("Sign Up"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          else if (_showUnlockButton)
            Container(
              color: Colors.deepOrangeAccent,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showLoginForm = true;
                      _showUnlockButton = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    'Unlock',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            )
          else
            Container(
              color: Colors.deepOrangeAccent,
              child: const Center(
                child: Text(
                  'Phone Locked\nFlip face up to unlock',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ),

          if (_showReloadingOverlay)
            Container(
              color: Colors.black54,
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool obscure = false,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black),
          prefixIcon: Icon(icon, color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding:
          const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        ),
        validator: validator,
      ),
    );
  }
}



