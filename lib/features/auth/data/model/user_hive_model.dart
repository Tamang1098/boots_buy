
import 'package:boots_buy/app/constant/hive_table_constant.dart';
import 'package:boots_buy/features/auth/domain/entity/user_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:uuid/uuid.dart';

part 'user_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.userId)
class UserHiveModel extends Equatable {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String username;

  @HiveField(3)
  final String password;

  @HiveField(4)
  final String? profilePhoto;

  @HiveField(5)
  final String role;

  UserHiveModel({
    String? userId,
    required this.email,
    required this.username,
    required this.password,
    this.profilePhoto,
    this.role = 'normal',
  }) : userId = userId ?? const Uuid().v4(); // Generate UUID if null

  const UserHiveModel.initial()
      : userId = '',
        email = '',
        username = '',
        password = '',
        profilePhoto = '',
        role = 'normal';

  /// From Domain Entity to Hive Model
  factory UserHiveModel.fromEntity(UserEntity entity) {
    return UserHiveModel(
      userId: entity.userId, // fallback
      email: entity.email,
      username: entity.username,
      password: entity.password,
      profilePhoto: entity.profilePhoto,
      role: entity.role,
    );
  }

  /// To  Entity
  UserEntity toEntity() {
    return UserEntity(
      userId: userId,
      email: email,
      username: username,
      password: password,
      profilePhoto: profilePhoto,
      role: role,
    );
  }


  // Convert List of HiveModels to List of Entities
  static List<UserEntity> toEntityList(List<UserHiveModel> hiveList) {
    return hiveList.map((data) => data.toEntity()).toList();
  }


  // Convert List of Entities to List of HiveModels
  static List<UserHiveModel> fromEntityList(List<UserEntity> entityList) {
    return entityList.map((data) => UserHiveModel.fromEntity(data)).toList();
  }

  @override
  List<Object?> get props => [userId, email, username, password, profilePhoto, role];
}
