import 'package:flutter/material.dart';
import 'package:social_app/core/utils/assets_manager.dart';
import 'package:social_app/features/auth/presentation/widgets/sign_in/alternative_sign_in_button.dart';

class AlternativeSignIn extends StatelessWidget {
  const AlternativeSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        AlternativeSignInButton(
          btnText: 'Sign In With Google',
          btnIcon: AssetsManager.imagesGoogleIcon,
          onPressed: () {},
        ),
        AlternativeSignInButton(
          btnText: 'Sign In With Apple',
          btnIcon: AssetsManager.imagesApplIcon,
          onPressed: () {},
        ),
        AlternativeSignInButton(
          btnText: 'Sign In With Facebook',
          btnIcon: AssetsManager.imagesFacebookIcon,
          onPressed: () {},
        ),
      ],
    );
  }
}
