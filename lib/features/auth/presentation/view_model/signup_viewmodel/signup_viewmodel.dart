import 'package:boots_buy/features/auth/domain/use_case/user_register_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup_event.dart';
import 'signup_state.dart';

// class SignupViewModel extends Bloc<SignupEvent, SignupState> {
//   final UserRegisterUsecase _userRegisterUsecase;

//   SignupViewModel({required UserRegisterUsecase userRegisterUsecase})
//       : _userRegisterUsecase = userRegisterUsecase,
//         super(SignupState.initial()) {
//     on<SignupButtonPressed>(_onSignupButtonPressed);
//   }

//   Future<void> _onSignupButtonPressed(
//       SignupButtonPressed event, Emitter<SignupState> emit) async {
//     emit(state.copyWith(isLoading: true));

//     final result = await _userRegisterUsecase.call(RegisterUserParams(
//       email: event.email.trim(),
//       username: event.username.trim(),
//       password: event.password.trim(),
//       address: event.address.trim(),
//       mobilenumber: event.mobilenumber.trim(),
//       profilePhoto: null,
//     ));

//     result.fold(
//           (failure) {
//         emit(state.copyWith(isLoading: false, isSuccess: false));
//         showMySnackBar(
//           context: event.context,
//           message: failure.message,
//           color: Colors.red,
//         );
//       },
//           (_) {
//         emit(state.copyWith(isLoading: false, isSuccess: true));
//         showMySnackBar(
//           context: event.context,
//           message: "Signup successful!",
//           color: Colors.green,
//         );
//       },
//     );
//   }
// }



class SignupViewModel extends Bloc<SignupEvent, SignupState> {
  final UserRegisterUsecase _userRegisterUsecase;
  final void Function({
    required Color color,
    required BuildContext context,
    required String message,
  }) showSnackBar;  // Store the injected callback

  SignupViewModel({
    required UserRegisterUsecase userRegisterUsecase,
    required this.showSnackBar, // assign it here
  })  : _userRegisterUsecase = userRegisterUsecase,
        super(SignupState.initial()) {
    on<SignupButtonPressed>(_onSignupButtonPressed);
  }

  Future<void> _onSignupButtonPressed(
      SignupButtonPressed event, Emitter<SignupState> emit) async {
    emit(state.copyWith(isLoading: true));

    final result = await _userRegisterUsecase.call(RegisterUserParams(
      email: event.email.trim(),
      username: event.username.trim(),
      password: event.password.trim(),
      address: event.address.trim(),
      mobilenumber: event.mobilenumber.trim(),
      profilePhoto: null,
    ));

    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, isSuccess: false));
        showSnackBar(
          context: event.context,
          message: failure.message,
          color: Colors.red,
        );
      },
      (_) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
        showSnackBar(
          context: event.context,
          message: "Signup successful!",
          color: Colors.green,
        );
      },
    );
  }
}
