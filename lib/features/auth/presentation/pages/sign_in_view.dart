import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/services/service_locator.dart';
import 'package:social_app/core/utils/widgets/custom_app_bar.dart';
import 'package:social_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:social_app/features/auth/presentation/cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:social_app/features/auth/presentation/widgets/sign_in/sign_in_view_body_bloc_consumer.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const String routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Sign in to your account', true),
      body: BlocProvider(
        create: (context) => SignInCubit(authRepo: getIt<AuthRepo>()),
        child: const SignInViewBodyBlocConsumer(),
      ),
    );
  }
}
