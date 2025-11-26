import 'package:flutter/material.dart';
import 'package:social_app/core/utils/styles.dart';

class SignInViewDivider extends StatelessWidget {
  const SignInViewDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(height: 1, color: const Color(0xffDDDFDF))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text('Or', style: Styles.styleBold18(context)),
        ),
        Expanded(child: Container(height: 1, color: const Color(0xffDDDFDF))),
      ],
    );
  }
}
