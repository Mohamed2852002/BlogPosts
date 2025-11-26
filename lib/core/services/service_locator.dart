import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:social_app/core/services/api_services.dart';
import 'package:social_app/core/services/back_end_auth_services.dart';
import 'package:social_app/core/services/back_end_posts_services.dart';
import 'package:social_app/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:social_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:social_app/features/home/data/repositories/posts_repo_impl.dart';
import 'package:social_app/features/home/domain/repositories/posts_repo.dart';

GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());

  getIt.registerSingleton<Dio>(Dio());

  getIt.registerSingleton<ApiServices>(ApiServices(dio: getIt<Dio>()));

  getIt.registerSingleton<BackEndAuthServices>(
    BackEndAuthServices(
      apiServices: getIt<ApiServices>(),
      storage: getIt<FlutterSecureStorage>(),
    ),
  );

  getIt.registerSingleton<BackEndPostsServices>(
    BackEndPostsServices(
      apiServices: getIt<ApiServices>(),
      storage: getIt<FlutterSecureStorage>(),
    ),
  );

  getIt.registerSingleton<PostsRepo>(
    PostsRepoImpl(backEndPostsServices: getIt<BackEndPostsServices>()),
  );

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(backEndAuthServices: getIt<BackEndAuthServices>()),
  );
}
