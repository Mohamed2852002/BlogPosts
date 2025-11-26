import 'package:flutter/material.dart';
import 'package:social_app/core/functions/custom_page_route.dart';
import 'package:social_app/features/auth/domain/entities/user_entity.dart';
import 'package:social_app/features/auth/presentation/pages/sign_in_view.dart';
import 'package:social_app/features/auth/presentation/pages/sign_up_view.dart';
import 'package:social_app/features/home/presentation/pages/home_view.dart';
import 'package:social_app/features/home/presentation/pages/post_creation_view.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SignInView.routeName:
      return CustomPageRoute(page: const SignInView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (_) => const SignUpView());
    case HomeView.routeName:
      {
        final user = settings.arguments as UserEntity;
        return CustomPageRoute(page: HomeView(userEntity: user));
      }
    case PostCreationView.routeName:
      return CustomPageRoute(
        page: const PostCreationView(),
        transitionType: TransitionType.slideFromRight,
        duration: const Duration(milliseconds: 200),
      );
    default:
      return MaterialPageRoute(builder: (_) => const SignInView());
  }
}
