import 'package:flutter/material.dart';
import 'package:social_app/core/functions/routes.dart';
import 'package:social_app/core/themes/app_theme.dart';
import 'package:social_app/features/auth/presentation/pages/sign_in_view.dart';

class BlogPosts extends StatelessWidget {
  const BlogPosts({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute:SignInView.routeName,
    );
  }
}
