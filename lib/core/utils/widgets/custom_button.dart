import 'package:flutter/material.dart';
import 'package:social_app/core/themes/app_colors.dart';
import 'package:social_app/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.btnText,
    this.backgroundColor = AppColors.primary,
  });
  final void Function()? onPressed;
  final String btnText;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          btnText,
          style: Styles.styleBold16(context).copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
