import 'package:flutter/material.dart';
import 'package:social_app/core/themes/app_colors.dart';
import 'package:social_app/core/utils/styles.dart';
import 'package:social_app/features/auth/presentation/pages/sign_up_view.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t Have An Account?',
          style: Styles.styleSemiBold16(
            context,
          ).copyWith(color: const Color(0xff949D9E)),
        ),
        Text(
          ' ',
          style: Styles.styleSemiBold16(
            context,
          ).copyWith(color: const Color(0xff949D9E)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SignUpView.routeName);
          },
          child: Text(
            'Create An Account',
            style: Styles.styleSemiBold16(
              context,
            ).copyWith(color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}
