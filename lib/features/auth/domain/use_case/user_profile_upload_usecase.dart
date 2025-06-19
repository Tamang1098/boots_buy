import 'dart:io';

import 'package:boots_buy/app/use_case/use_case.dart';
import 'package:boots_buy/core/error/failure.dart';
import 'package:boots_buy/features/auth/domain/repository/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserUploadProfilePictureParams {
  final File file;

  const UserUploadProfilePictureParams({required this.file});
}

class UserUploadProfilePictureUsecase
    implements UsecaseWithParams<String, UserUploadProfilePictureParams> {
  final IUserRepository _userRepository;

  UserUploadProfilePictureUsecase({required IUserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<Either<Failure, String>> call(UserUploadProfilePictureParams params) {
    return _userRepository.uploadProfilePicture(params.file);
  }
}
