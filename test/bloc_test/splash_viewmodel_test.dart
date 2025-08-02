import 'package:flutter_test/flutter_test.dart';
import 'package:boots_buy/features/splash/presentation/view_model/splash_viewmodel.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  group('SplashViewModel', () {
    late SplashViewModel splashViewModel;

    setUp(() {
      splashViewModel = SplashViewModel();
    });

    test('initial state is SplashState.initial', () {
      expect(splashViewModel.state, SplashState.initial);
    });

    test('emits navigateToHome when isLoggedIn is true', () async {
      SharedPreferences.setMockInitialValues({'isLoggedIn': true});
      splashViewModel = SplashViewModel();
      await splashViewModel.decideNavigation();
      expect(splashViewModel.state, SplashState.navigateToHome);
    });

    test('emits navigateToLogin when isLoggedIn is false', () async {
      SharedPreferences.setMockInitialValues({'isLoggedIn': false});
      splashViewModel = SplashViewModel();
      await splashViewModel.decideNavigation();
      expect(splashViewModel.state, SplashState.navigateToLogin);
    });

    test('emits navigateToLogin when isLoggedIn is missing', () async {
      SharedPreferences.setMockInitialValues({});
      splashViewModel = SplashViewModel();
      await splashViewModel.decideNavigation();
      expect(splashViewModel.state, SplashState.navigateToLogin);
    });

    test('waits at least 2 seconds before navigating', () async {
      SharedPreferences.setMockInitialValues({'isLoggedIn': true});
      splashViewModel = SplashViewModel();
      final stopwatch = Stopwatch()..start();
      await splashViewModel.decideNavigation();
      stopwatch.stop();
      expect(stopwatch.elapsed.inSeconds >= 2, isTrue);
    });

    test('can call decideNavigation multiple times', () async {
      SharedPreferences.setMockInitialValues({'isLoggedIn': true});
      splashViewModel = SplashViewModel();
      await splashViewModel.decideNavigation();
      expect(splashViewModel.state, SplashState.navigateToHome);
      SharedPreferences.setMockInitialValues({'isLoggedIn': false});
      await splashViewModel.decideNavigation();
      expect(splashViewModel.state, SplashState.navigateToLogin);
    });

   

    test('state remains initial before decideNavigation', () {
      expect(splashViewModel.state, SplashState.initial);
    });

   
  });
}