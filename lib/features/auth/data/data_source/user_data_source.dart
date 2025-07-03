import 'package:boots_buy/features/auth/domain/entity/user_entity.dart';

abstract interface class IUserDataSource {
  Future<void> registerUser(UserEntity user);

  Future<String> loginUser(String email, String password);

  Future<String> uploadProfilePicture(String filePath);

  Future<UserEntity> getCurrentUser(String id);
}