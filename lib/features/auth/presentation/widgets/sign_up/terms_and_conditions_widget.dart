import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:social_app/core/themes/app_colors.dart';
import 'package:social_app/core/utils/styles.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Transform.scale(
          scale: 1.2,
          child: Checkbox(
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
            side: const BorderSide(width: 1.5, color: Color(0xffDDDFDF)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
                widget.onChanged(value);
              });
            },
          ),
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'On Creating an account, you agree to our ',
                  style: Styles.styleSemiBold14(
                    context,
                  ).copyWith(color: const Color(0xFF949D9E)),
                ),
                const TextSpan(text: ' '),
                TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () {},
                  text: 'Terms of Conditions',
                  style: Styles.styleSemiBold14(
                    context,
                  ).copyWith(color: AppColors.primary),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
