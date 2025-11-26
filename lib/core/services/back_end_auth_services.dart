import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:social_app/core/services/api_services.dart';
import 'package:social_app/core/utils/constants.dart';
import 'package:social_app/features/auth/data/models/user_model.dart';
import 'package:social_app/features/auth/domain/entities/user_entity.dart';

class BackEndAuthServices {
  final ApiServices apiServices;
  final FlutterSecureStorage storage;
  BackEndAuthServices({required this.apiServices, required this.storage});

  static const String registerEndpoint = '${baseUrl}auth/register';
  static const String loginEndpoint = '${baseUrl}auth/login';

  Future<UserEntity> register({
    required String username,
    required String email,
    required String password,
    required String password2,
    required String firstName,
    required String lastName,
  }) async {
    final response = await apiServices.post(registerEndpoint, {
      'username': username,
      'email': email,
      'password': password,
      'password2': password2,
      'first_name': firstName,
      'last_name': lastName,
    });
    secureTokens(response);
    return UserModel.fromJson(response['data']['user']);
  }

  Future<UserEntity> login(String username, String password) async {
    final response = await apiServices.post(loginEndpoint, {
      'username': username,
      'password': password,
    });
    await secureTokens(response);
    return UserModel.fromJson(response['data']['user']);
  }

  Future<void> secureTokens(Map<String, dynamic> response) async {
    await storage.write(
      key: kAccessToken,
      value: response['data']['tokens']['access'],
    );
    await storage.write(
      key: kRefreshToken,
      value: response['data']['tokens']['refresh'],
    );
  }

  Future<void> deleteTokens() async {
    await storage.delete(key: kAccessToken);
    await storage.delete(key: kRefreshToken);
  }
}
