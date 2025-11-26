import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/services/service_locator.dart';
import 'package:social_app/core/utils/widgets/custom_app_bar.dart';
import 'package:social_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:social_app/features/auth/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:social_app/features/auth/presentation/widgets/sign_up/sign_up_view_body_bloc_consumer.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = 'signUp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Sign Up', false),
      body: BlocProvider(
        create: (context) => SignUpCubit(authRepo: getIt<AuthRepo>()),
        child: const SignUpViewBodyBlocConsumer(),
      ),
    );
  }
}
