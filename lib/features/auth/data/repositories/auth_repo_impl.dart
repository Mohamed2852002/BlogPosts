import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:social_app/core/errors/custom_exceptions.dart';
import 'package:social_app/core/errors/failure.dart';
import 'package:social_app/core/services/back_end_auth_services.dart';
import 'package:social_app/core/utils/boxes/boxes.dart';
import 'package:social_app/features/auth/domain/entities/user_entity.dart';
import 'package:social_app/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final BackEndAuthServices backEndAuthServices;

  AuthRepoImpl({required this.backEndAuthServices});
  @override
  Future<Either<Failure, UserEntity>> register({
    required String username,
    required String email,
    required String password,
    required String password2,
    required String firstName,
    required String lastName,
  }) async {
    try {
      userBox.clear();
      final user = await backEndAuthServices.register(
        username: username,
        email: email,
        password: password,
        password2: password2,
        firstName: firstName,
        lastName: lastName,
      );
      userBox.add(user);
      return right(user);
    } on DioException catch (e) {
      log(
        'Error in AuthRepoImpl.createUserWithEmailAndPassword : ${e.toString()}',
      );
      return left(ServerFailure.fromDioException(e));
    } on CustomException catch (e) {
      log(
        'Error in AuthRepoImpl.createUserWithEmailAndPassword : ${e.toString()}',
      );
      return left(ServerFailure(errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login({
    required String username,
    required String password,
  }) async {
    try {
      userBox.clear();
      final user = await backEndAuthServices.login(username, password);
      userBox.add(user);
      return right(user);
    } on DioException catch (e) {
      log('Error in AuthRepoImpl.login : ${e.toString()}');
      return left(ServerFailure.fromDioException(e));
    } on CustomException catch (e) {
      log('Error in AuthRepoImpl.login : ${e.toString()}');
      return left(ServerFailure(errorMessage: e.errorMessage));
    }
  }
}
