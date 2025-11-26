import 'package:social_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.userId,
    required super.userName,
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.bio,
    required super.profilPicture,
  });

  factory UserModel.fromJson(Map<String, dynamic>? data) {
    return UserModel(
      userId: data?['id'] ?? '',
      userName: data?['username'] ?? '',
      email: data?['email'] ?? '',
      firstName: data?['first_name'] ?? '',
      lastName: data?['last_name'] ?? '',
      bio: data?['bio'] ?? '',
      profilPicture: data?['profile_picture'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': userId,
      'username': userName,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'bio': bio,
      'profile_picture': profilPicture,
    };
  }
}
