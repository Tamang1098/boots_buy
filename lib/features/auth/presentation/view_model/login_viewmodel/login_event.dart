import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => [];
}

class LoginUserEvent extends LoginEvent {
  final String email;
  final String password;
  final BuildContext context;

  const LoginUserEvent({
    required this.email,
    required this.password,
    required this.context,
  });

  @override
  List<Object?> get props => [email, password, context];
}
class NavigateToSignUpEvent extends LoginEvent {
  final BuildContext context;

  const NavigateToSignUpEvent({required this.context});
}
