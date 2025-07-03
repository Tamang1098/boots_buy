
import 'package:boots_buy/features/auth/domain/entity/user_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_api_model.g.dart';

@JsonSerializable()
class UserApiModel extends Equatable {

  final String? userId;
  final String email;
  final String username;

  final String password;
  final String? profilePhoto;
  final String role;

  UserApiModel(
      { this.userId,
        required this.email,
        required this.username,
        required this.password,
        this.profilePhoto,
        required this.role});

  // JSON serialization
  factory UserApiModel.fromJson(Map<String, dynamic> json) =>
      _$UserApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserApiModelToJson(this);

  // To Entity
  UserEntity toEntity() {
    return UserEntity(
      userId: userId,
      email: email,
      username: username,
      password: password,
      profilePhoto: profilePhoto ?? '',
      role: role ?? 'normal',
    );
  }

  // From Entity
  factory UserApiModel.fromEntity(UserEntity entity) {
    return UserApiModel(
      userId: entity.userId,
      email: entity.email,
      username: entity.username,
      password: entity.password,
      profilePhoto: entity.profilePhoto,
      role: entity.role,
    );
  }

  @override
  List<Object?> get props => [
    userId,
    email,
    username,
    password,
    profilePhoto,
    role,
  ];
}