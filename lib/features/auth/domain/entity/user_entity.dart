import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? userId;
  final String email;
  final String username;
  final String password;
  final String? profilePhoto;
  final String role;
  final String address;
  final String mobilenumber;

  const UserEntity({
    this.userId,
    required this.email,
    required this.username,
    required this.password,
    this.profilePhoto,
    required this.address,
    required this.mobilenumber,
    this.role = 'normal',
  });

  @override
  List<Object?> get props => [
    userId,
    email,
    username,
    password,
    profilePhoto,
    address,
    mobilenumber,
    role,
  ];
}
