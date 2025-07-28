
import 'package:boots_buy/features/auth/presentation/view/View/signup.dart';
import 'package:boots_buy/features/auth/presentation/view_model/signup_viewmodel/signup_event.dart';
import 'package:boots_buy/features/auth/presentation/view_model/signup_viewmodel/signup_state.dart';
import 'package:boots_buy/features/auth/presentation/view_model/signup_viewmodel/signup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock SignupViewModel
class MockSignupViewModel extends Mock implements SignupViewModel {}

class FakeSignupEvent extends Fake implements SignupEvent {}

class FakeSignupState extends Fake implements SignupState {}

void main() {
  late MockSignupViewModel mockSignupViewModel;

  setUpAll(() {
    registerFallbackValue(FakeSignupEvent());
    registerFallbackValue(FakeSignupState());
  });

  setUp(() {
    mockSignupViewModel = MockSignupViewModel();

    // Stub the stream getter to provide states for BlocBuilder
    when(() => mockSignupViewModel.stream)
        .thenAnswer((_) => Stream<SignupState>.fromIterable([SignupState.initial()]));

    // Stub the state getter to return the initial state
    when(() => mockSignupViewModel.state).thenReturn(SignupState.initial());
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<SignupViewModel>.value(
        value: mockSignupViewModel,
        child: const SignupScreen(),
      ),
    );
  }

 testWidgets('renders all input fields and buttons', (WidgetTester tester) async {
  await tester.pumpWidget(createWidgetUnderTest());

  // 5 input fields
  expect(find.byType(TextFormField), findsNWidgets(5));

  // There are exactly 2 Text widgets with 'Sign Up' (title + button)
  expect(find.text('Sign Up'), findsNWidgets(2));

  // Signup button with text 'Sign Up'
  expect(find.widgetWithText(ElevatedButton, 'Sign Up'), findsOneWidget);

  // Login button with text 'Login'
  expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
});



   testWidgets('shows validation errors when submitting empty form', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    // Wait for initial build
    await tester.pumpAndSettle();

    final signUpButton = find.widgetWithText(ElevatedButton, 'Sign Up');

    // Ensure visible before tap
    await tester.ensureVisible(signUpButton);

    await tester.tap(signUpButton);
    await tester.pumpAndSettle();

    // Check for expected validation messages
    expect(find.text('Enter username'), findsOneWidget);
    expect(find.text('Enter email'), findsOneWidget);
    expect(find.text('Password requires at least 6 characters'), findsOneWidget);
    expect(find.text('Enter address'), findsOneWidget);
    expect(find.text('Enter mobile number'), findsOneWidget);
  });


  testWidgets('shows CircularProgressIndicator when loading', (WidgetTester tester) async {
    // Stub the stream and state to loading state for this test
    when(() => mockSignupViewModel.stream)
        .thenAnswer((_) => Stream<SignupState>.fromIterable([SignupState(isLoading: true, isSuccess: false)]));
    when(() => mockSignupViewModel.state).thenReturn(SignupState(isLoading: true, isSuccess: false));

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Sign Up'), findsNothing);
  });
}
