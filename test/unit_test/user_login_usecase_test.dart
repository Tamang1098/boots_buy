

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:boots_buy/features/auth/domain/repository/user_repository.dart';
import 'package:boots_buy/features/auth/domain/use_case/user_login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:boots_buy/core/error/failure.dart';

class MockUserRepository extends Mock implements IUserRepository {}

void main() {
  late UserLoginUsecase usecase;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    usecase = UserLoginUsecase(userRepository: mockUserRepository);
  });

  final testParams = UserLoginParams(email: 'test@example.com', password: 'password');

  test('should call loginUser and return token on success', () async {
    when(() => mockUserRepository.loginUser(any(), any()))
        .thenAnswer((_) async => Right('token'));

    final result = await usecase.call(testParams);

    expect(result.isRight(), true);
    verify(() => mockUserRepository.loginUser(testParams.email, testParams.password)).called(1);
  });

  test('should return failure on login failure', () async {
    when(() => mockUserRepository.loginUser(any(), any()))
        .thenAnswer((_) async => Left(LocalDatabaseFailure(message: 'error')));

    final result = await usecase.call(testParams);

    expect(result.isLeft(), true);
    verify(() => mockUserRepository.loginUser(testParams.email, testParams.password)).called(1);
  });
}
