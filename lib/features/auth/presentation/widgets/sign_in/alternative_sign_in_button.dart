import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_app/core/themes/app_colors.dart';
import 'package:social_app/core/utils/styles.dart';

class AlternativeSignInButton extends StatelessWidget {
  const AlternativeSignInButton({
    super.key,
    this.onPressed,
    required this.btnText,
    required this.btnIcon,
  });
  final void Function()? onPressed;
  final String btnText, btnIcon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          backgroundColor: AppColors.surfaceColor,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xffDDDFDF)),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            SvgPicture.asset(btnIcon),
            const Spacer(),
            Text(btnText, style: Styles.styleBold16(context)),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
