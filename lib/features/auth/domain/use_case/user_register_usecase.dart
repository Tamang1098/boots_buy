import 'package:boots_buy/app/use_case/use_case.dart';
import 'package:boots_buy/core/error/failure.dart';
import 'package:boots_buy/features/auth/domain/entity/user_entity.dart';
import 'package:boots_buy/features/auth/domain/repository/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class RegisterUserParams extends Equatable {
  final String email;
  final String username;
  // final int studentId;
  final String password;
  final String? profilePhoto;


  const RegisterUserParams({
    required this.email,
    required this.username,
    // required this.studentId,
    required this.password,
    this.profilePhoto,
  });

  @override
  List<Object?> get props => [
        email,
        username,
        // studentId,
        password,
        profilePhoto,

      ];
}

/// ------------------- USE CASE -------------------

class UserRegisterUsecase
    implements UsecaseWithParams<void, RegisterUserParams> {
  final IUserRepository _userRepository;

  UserRegisterUsecase({required IUserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) {
    final user = UserEntity(
      email: params.email,
      username: params.username,
      // studentId: params.studentId,
      password: params.password,
      profilePhoto: params.profilePhoto,

    );
    return _userRepository.registerUser(user);
  }
}
