import 'package:bloc_test/bloc_test.dart';
import 'package:boots_buy/core/error/failure.dart';
import 'package:boots_buy/features/auth/domain/use_case/user_register_usecase.dart';
import 'package:boots_buy/features/auth/presentation/view_model/signup_viewmodel/signup_event.dart';
import 'package:boots_buy/features/auth/presentation/view_model/signup_viewmodel/signup_state.dart';
import 'package:boots_buy/features/auth/presentation/view_model/signup_viewmodel/signup_viewmodel.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock class for UserRegisterUsecase
class MockUserRegisterUsecase extends Mock implements UserRegisterUsecase {}

// Fake BuildContext for testing
class FakeBuildContext extends Fake implements BuildContext {}

// Concrete Failure subclass for testing
class TestFailure extends Failure {
  const TestFailure({required super.message});
}

void main() {
  late MockUserRegisterUsecase mockUserRegisterUsecase;
  late SignupViewModel signupViewModel;

  // No-op fake SnackBar function
  void fakeSnackBar({
    required BuildContext context,
    required String message,
    required Color color,
  }) {
    // do nothing
  }

  setUpAll(() {
    registerFallbackValue(FakeBuildContext());
    registerFallbackValue(RegisterUserParams(
      email: '',
      username: '',
      password: '',
      address: '',
      mobilenumber: '',
      profilePhoto: null,
    ));
    registerFallbackValue(const TestFailure(message: ''));
  });

  setUp(() {
    mockUserRegisterUsecase = MockUserRegisterUsecase();
    signupViewModel = SignupViewModel(
      userRegisterUsecase: mockUserRegisterUsecase,
      showSnackBar: fakeSnackBar,
    );
  });

  const tEmail = 'test@example.com';
  const tUsername = 'testuser';
  const tPassword = 'password123';
  const tAddress = 'Test Address';
  const tMobileNumber = '9800000000';

  final tParams = RegisterUserParams(
    email: tEmail.trim(),
    username: tUsername.trim(),
    password: tPassword.trim(),
    address: tAddress.trim(),
    mobilenumber: tMobileNumber.trim(),
    profilePhoto: null,
  );

  blocTest<SignupViewModel, SignupState>(
    'emits [loading true, success true] when signup succeeds',
    build: () {
      when(() => mockUserRegisterUsecase.call(any()))
          .thenAnswer((_) async => const Right(null));
      return signupViewModel;
    },
    act: (bloc) => bloc.add(SignupButtonPressed(
      email: tEmail,
      username: tUsername,
      password: tPassword,
      address: tAddress,
      mobilenumber: tMobileNumber,
      context: FakeBuildContext(),
    )),
    expect: () => [
      SignupState.initial().copyWith(isLoading: true),
      SignupState.initial().copyWith(isLoading: false, isSuccess: true),
    ],
    verify: (_) {
      verify(() => mockUserRegisterUsecase.call(tParams)).called(1);
    },
  );

  blocTest<SignupViewModel, SignupState>(
    'emits [loading true, success false] when signup fails',
    build: () {
      when(() => mockUserRegisterUsecase.call(any()))
          .thenAnswer((_) async => const Left(TestFailure(message: 'Signup failed')));
      return signupViewModel;
    },
    act: (bloc) => bloc.add(SignupButtonPressed(
      email: tEmail,
      username: tUsername,
      password: tPassword,
      address: tAddress,
      mobilenumber: tMobileNumber,
      context: FakeBuildContext(),
    )),
    expect: () => [
      SignupState.initial().copyWith(isLoading: true),
      SignupState.initial().copyWith(isLoading: false, isSuccess: false),
    ],
    verify: (_) {
      verify(() => mockUserRegisterUsecase.call(tParams)).called(1);
    },
  );
}
