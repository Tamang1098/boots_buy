import 'package:boots_buy/features/auth/data/repository/local_repository/user_local_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:boots_buy/features/auth/data/data_source/user_data_source.dart';
import 'package:boots_buy/features/auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:boots_buy/core/error/failure.dart';

class MockUserDataSource extends Mock implements IUserDataSource {}

void main() {
  late UserLocalRepository repository;
  late MockUserDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockUserDataSource();
    repository = UserLocalRepository(dataSource: mockDataSource);
  });

  final testUser = UserEntity(
    email: 'test@example.com',
    username: 'testuser',
    password: 'password',
    address: 'address',
    mobilenumber: '1234567890',
    profilePhoto: null,
  );

  test('should get current user successfully', () async {
    when(() => mockDataSource.getCurrentUser(any()))
        .thenAnswer((_) async => testUser);

    final result = await repository.getCurrentUser('userId');

    expect(result.isRight(), true);
    verify(() => mockDataSource.getCurrentUser('userId')).called(1);
  });

  test('should return failure when getCurrentUser throws', () async {
    when(() => mockDataSource.getCurrentUser(any()))
        .thenThrow(Exception('DB error'));

    final result = await repository.getCurrentUser('userId');

    expect(result.isLeft(), true);
    verify(() => mockDataSource.getCurrentUser('userId')).called(1);
  });

  test('should login user successfully', () async {
    when(() => mockDataSource.loginUser(any(), any()))
        .thenAnswer((_) async => 'Logged in');

    final result = await repository.loginUser('email', 'password');

    expect(result.isRight(), true);
    verify(() => mockDataSource.loginUser('email', 'password')).called(1);
  });

  test('should return failure when loginUser throws', () async {
    when(() => mockDataSource.loginUser(any(), any()))
        .thenThrow(Exception('DB error'));

    final result = await repository.loginUser('email', 'password');

    expect(result.isLeft(), true);
    verify(() => mockDataSource.loginUser('email', 'password')).called(1);
  });




}
