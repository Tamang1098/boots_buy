// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dartz/dartz.dart';
// import 'package:boots_buy/app/shared_pref/token_shared_prefs.dart';
// import 'package:boots_buy/core/error/failure.dart';

// class MockSharedPreferences extends Mock implements SharedPreferences {}

// void main() {
//   late TokenSharedPrefs tokenSharedPrefs;
//   late MockSharedPreferences mockSharedPreferences;

//   setUp(() {
//     mockSharedPreferences = MockSharedPreferences();
//     tokenSharedPrefs = TokenSharedPrefs(sharedPreferences: mockSharedPreferences);
//   });

//   test('saveToken success returns Right', () async {
//     when(() => mockSharedPreferences.setString(any(), any()))
//         .thenAnswer((_) async => true);

//     final result = await tokenSharedPrefs.saveToken('token123');

//     expect(result.isRight(), true);
//     verify(() => mockSharedPreferences.setString('token', 'token123')).called(1);
//   });

//   test('saveToken failure returns Left', () async {
//     when(() => mockSharedPreferences.setString(any(), any()))
//         .thenThrow(Exception('fail'));

//     final result = await tokenSharedPrefs.saveToken('token123');

//     expect(result.isLeft(), true);
//   });

//   test('getToken success returns Right with token', () async {
//     when(() => mockSharedPreferences.getString(any()))
//         .thenReturn('token123');

//     final result = await tokenSharedPrefs.getToken();

//     expect(result.isRight(), true);
//     expect(result.getOrElse(() => null), 'token123');
//     verify(() => mockSharedPreferences.getString('token')).called(1);
//   });

//   test('getToken failure returns Left', () async {
//     when(() => mockSharedPreferences.getString(any()))
//         .thenThrow(Exception('fail'));

//     final result = await tokenSharedPrefs.getToken();

//     expect(result.isLeft(), true);
//   });

//   test('clearToken success returns Right', () async {
//     when(() => mockSharedPreferences.remove(any()))
//         .thenAnswer((_) async => true);

//     final result = await tokenSharedPrefs.clearToken();

//     expect(result.isRight(), true);
//     verify(() => mockSharedPreferences.remove('token')).called(1);
//   });

//   test('clearToken failure returns Left', () async {
//     when(() => mockSharedPreferences.remove(any()))
//         .thenThrow(Exception('fail'));

//     final result = await tokenSharedPrefs.clearToken();

//     expect(result.isLeft(), true);
//   });
// }



import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dartz/dartz.dart';
import 'package:boots_buy/app/shared_pref/token_shared_prefs.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late TokenSharedPrefs tokenSharedPrefs;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    tokenSharedPrefs = TokenSharedPrefs(sharedPreferences: mockSharedPreferences);
  });

  test('saveToken success returns Right', () async {
    when(() => mockSharedPreferences.setString(any(), any()))
        .thenAnswer((_) async => true);

    final result = await tokenSharedPrefs.saveToken('token123');

    expect(result.isRight(), true);
    verify(() => mockSharedPreferences.setString('token', 'token123')).called(1);
  });

  test('saveToken failure returns Left', () async {
    when(() => mockSharedPreferences.setString(any(), any()))
        .thenThrow(Exception('fail'));

    final result = await tokenSharedPrefs.saveToken('token123');

    expect(result.isLeft(), true);
  });

  test('getToken success returns Right with token', () async {
    when(() => mockSharedPreferences.getString(any()))
        .thenReturn('token123');

    final result = await tokenSharedPrefs.getToken();

    expect(result.isRight(), true);
    expect(result.getOrElse(() => null), 'token123');
    verify(() => mockSharedPreferences.getString('token')).called(1);
  });

  test('getToken failure returns Left', () async {
    when(() => mockSharedPreferences.getString(any()))
        .thenThrow(Exception('fail'));

    final result = await tokenSharedPrefs.getToken();

    expect(result.isLeft(), true);
  });

  test('clearToken success returns Right', () async {
    when(() => mockSharedPreferences.remove(any()))
        .thenAnswer((_) async => true);

    final result = await tokenSharedPrefs.clearToken();

    expect(result.isRight(), true);
    verify(() => mockSharedPreferences.remove('token')).called(1);
  });

  test('clearToken failure returns Left', () async {
    when(() => mockSharedPreferences.remove(any()))
        .thenThrow(Exception('fail'));

    final result = await tokenSharedPrefs.clearToken();

    expect(result.isLeft(), true);
  });
}
