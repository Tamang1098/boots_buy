import 'dart:io';

import 'package:boots_buy/core/error/failure.dart';
import 'package:boots_buy/features/auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart' show Either;

abstract interface class IUserRepository {
  Future<Either<Failure, void>> registerUser(UserEntity user);

  Future<Either<Failure, String>> loginUser(
      String username,
      String password,
      );

  Future<Either<Failure, String>> uploadProfilePicture(File file);

  Future<Either<Failure, UserEntity>> getCurrentUser(String id);
}