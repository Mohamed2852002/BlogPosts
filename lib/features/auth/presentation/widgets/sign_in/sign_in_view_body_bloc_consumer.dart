import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/functions/show_custom_snack_bar.dart';
import 'package:social_app/core/utils/widgets/custom_progress_hud.dart';
import 'package:social_app/features/auth/presentation/cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:social_app/features/auth/presentation/widgets/sign_in/sign_in_view_body.dart';
import 'package:social_app/features/home/presentation/pages/home_view.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInFailure) {
          showCustomSnackBar(
            context,
            state.errorMessage,
            backgroundColor: Colors.red,
          );
        } else if (state is SignInSuccess) {
          showCustomSnackBar(context, 'Sign in successful!');
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeView.routeName,
            (route) => false,
            arguments: state.userEntity,
          );
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SignInLoading ? true : false,
          child: const SignInViewBody(),
        );
      },
    );
  }
}
