import 'package:flutter/material.dart';
import 'package:social_app/core/functions/validate_email.dart';
import 'package:social_app/core/utils/styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.isEmail = false,
    this.hasLabel = true,
    this.minLines,
    this.maxLines = 1,
    required this.textInputType,
    this.onSaved,
  });
  final String hintText;
  final bool isPassword;
  final bool isEmail;
  final bool hasLabel;
  final int? minLines, maxLines;
  final TextInputType textInputType;
  final void Function(String?)? onSaved;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      style: Styles.styleBold18(context),
      onSaved: widget.onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        if (widget.isEmail && !validateEmail(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
      keyboardType: widget.textInputType,
      obscureText: widget.isPassword ? !isPasswordVisible : false,
      decoration: InputDecoration(
        labelText: widget.hasLabel ? widget.hintText : null,
        labelStyle: Styles.styleBold14(
          context,
        ).copyWith(color: const Color(0xffC9CECF)),
        suffixIcon:
            widget.isPassword
                ? IconButton(
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: const Color(0xffC9CECF),
                  ),
                )
                : null,
        filled: true,
        fillColor: const Color(0xff364153),
        border: textFieldBorder(),
        enabledBorder: textFieldBorder(),
        hintText: widget.hintText,
        hintStyle: Styles.styleBold14(
          context,
        ).copyWith(color: const Color(0xff949D9E)),
      ),
    );
  }

  OutlineInputBorder textFieldBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: Color(0xffE6E9EA)),
    );
  }
}
