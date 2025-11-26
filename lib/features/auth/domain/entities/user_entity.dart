import 'package:hive_flutter/hive_flutter.dart';

part 'user_entity.g.dart';
@HiveType(typeId: 0)
class UserEntity extends HiveObject {
  @HiveField(0)
  final int userId;
  @HiveField(1)
  final String userName;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String firstName;
  @HiveField(4)
  final String lastName;
  @HiveField(5)
  final String bio;
  @HiveField(6)
  final String profilPicture;

  UserEntity({
    required this.userId,
    required this.userName,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.bio,
    required this.profilPicture,
  });
}
