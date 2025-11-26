import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:social_app/core/themes/app_colors.dart';
import 'package:social_app/core/utils/styles.dart';

class AlreadyHaveAnAccountWidget extends StatelessWidget {
  const AlreadyHaveAnAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account?',
            style: Styles.styleSemiBold16(
              context,
            ).copyWith(color: const Color(0xff949D9E)),
          ),
          const TextSpan(text: ' '),
          TextSpan(
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pop(context);
                  },
            text: 'Sign In',
            style: Styles.styleSemiBold16(
              context,
            ).copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
