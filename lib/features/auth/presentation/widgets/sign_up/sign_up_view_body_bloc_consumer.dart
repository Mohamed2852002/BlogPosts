import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/functions/show_custom_snack_bar.dart';
import 'package:social_app/core/utils/widgets/custom_progress_hud.dart';
import 'package:social_app/features/auth/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:social_app/features/auth/presentation/widgets/sign_up/sign_up_view_body.dart';
import 'package:social_app/features/home/presentation/pages/home_view.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          showCustomSnackBar(
            context,
            state.errorMessage,
            backgroundColor: Colors.red,
          );
        } else if (state is SignUpSuccess) {
          showCustomSnackBar(context, 'Sign up successful!');
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
          isLoading: state is SignUpLoading ? true : false,
          child: const SignUpViewBody(),
        );
      },
    );
  }
}
