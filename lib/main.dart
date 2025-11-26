import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:social_app/blog_posts.dart';
import 'package:social_app/core/services/service_locator.dart';
import 'package:social_app/core/services/simple_bloc_observer.dart';
import 'package:social_app/core/utils/boxes/boxes.dart';
import 'package:social_app/core/utils/constants.dart';
import 'package:social_app/features/auth/domain/entities/user_entity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(UserEntityAdapter());
  userBox = await Hive.openBox<UserEntity>(usersBox);

  await setupServiceLocator();

  Bloc.observer = SimpleBlocObserver();

  runApp(const BlogPosts());
}
