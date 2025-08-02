import 'package:bloc_test/bloc_test.dart';
import 'package:boots_buy/features/auth/presentation/view/View/login.dart';
import 'package:boots_buy/features/auth/presentation/view_model/login_viewmodel/login_viewmodel.dart';
import 'package:boots_buy/features/home/presentation/view/HomePage.dart';
import 'package:boots_buy/features/home/presentation/view_model/homepage_viewmodel.dart';
import 'package:boots_buy/features/splash/presentation/view/splash_screenview.dart';
import 'package:boots_buy/features/splash/presentation/view_model/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSplashViewModel extends Mock implements SplashViewModel {}

class MockHomeViewModel extends Mock implements HomeViewModel {}

class MockLoginViewModel extends Mock implements LoginViewModel {}

void main() {
  late MockSplashViewModel splashViewModel;
  late MockHomeViewModel homeViewModel;
  late MockLoginViewModel loginViewModel;

  setUp(() {
    splashViewModel = MockSplashViewModel();
    homeViewModel = MockHomeViewModel();
    loginViewModel = MockLoginViewModel();
  });

  Future<void> pumpSplashScreen(WidgetTester tester) async {
    when(() => splashViewModel.decideNavigation()).thenAnswer((_) async {});

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<SplashViewModel>.value(
          value: splashViewModel,
          child: const SplashScreenView(),
        ),
      ),
    );
  }



  testWidgets('Navigates to HomePage on SplashState.navigateToHome',
          (WidgetTester tester) async {
        when(() => splashViewModel.decideNavigation()).thenAnswer((_) async {});
        whenListen(
          splashViewModel,
          Stream<SplashState>.fromIterable([SplashState.navigateToHome]),
          initialState: SplashState.initial,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: MultiBlocProvider(
              providers: [
                BlocProvider<SplashViewModel>.value(value: splashViewModel),
                BlocProvider<HomeViewModel>.value(value: homeViewModel),
              ],
              child: const SplashScreenView(),
            ),
          ),
        );

        // Wait for navigation
        await tester.pumpAndSettle();

        expect(find.byType(HomePage), findsOneWidget);
      });


}
