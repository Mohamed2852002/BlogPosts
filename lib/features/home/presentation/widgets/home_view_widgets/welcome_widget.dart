import 'package:flutter/material.dart';
import 'package:social_app/core/themes/app_colors.dart';
import 'package:social_app/core/utils/styles.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey, width: 0.3),
      ),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Welcome to BlogPosts', style: Styles.styleBold26(context)),
          Text(
            'Share your thoughts, connect with others, and explore interesting content.',
            style: Styles.styleBold18(context),
          ),
        ],
      ),
    );
  }
}
