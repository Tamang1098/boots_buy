import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:boots_buy/core/error/failure.dart';
import 'package:boots_buy/features/auth/domain/entity/user_entity.dart';
import 'package:boots_buy/features/auth/domain/repository/user_repository.dart';
import 'package:boots_buy/features/auth/domain/use_case/user_register_usecase.dart';

class MockUserRepository extends Mock implements IUserRepository {}

void main() {
  late UserRegisterUsecase usecase;
  late MockUserRepository mockRepository;

  final tUserEntity = UserEntity(
    email: 'test@example.com',
    username: 'testuser',
    password: 'password123',
    address: '123 Test St',
    mobilenumber: '9876543210',
    profilePhoto: null,
  );

  final tParams = RegisterUserParams(
    email: 'test@example.com',
    username: 'testuser',
    password: 'password123',
    address: '123 Test St',
    mobilenumber: '9876543210',
  );

  setUpAll(() {
    // Register fallback so `any()` works with UserEntity
    registerFallbackValue(UserEntity(
      email: '',
      username: '',
      password: '',
      address: '',
      mobilenumber: '',
      profilePhoto: null,
    ));
  });

  setUp(() {
    mockRepository = MockUserRepository();
    usecase = UserRegisterUsecase(userRepository: mockRepository);
  });

  test('should return Success (Right) when repository call is successful', () async {
    // Arrange
    when(() => mockRepository.registerUser(any()))
        .thenAnswer((_) async => const Right(null));

    // Act
    final result = await usecase(tParams);

    // Assert
    expect(result, equals(const Right(null)));
    verify(() => mockRepository.registerUser(any())).called(1);
  });

  test('should return Failure when repository fails', () async {
    // Arrange
    when(() => mockRepository.registerUser(any()))
        .thenAnswer((_) async => Left(ServerFailure(message: 'Registration failed')));

    // Act
    final result = await usecase(tParams);

    // Assert
    expect(result, equals(Left(ServerFailure(message: 'Registration failed'))));
    verify(() => mockRepository.registerUser(any())).called(1);
  });
}
