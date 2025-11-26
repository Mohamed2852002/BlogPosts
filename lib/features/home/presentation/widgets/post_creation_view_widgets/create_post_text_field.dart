import 'package:flutter/material.dart';
import 'package:social_app/core/utils/styles.dart';

class CreatePostTextField extends StatelessWidget {
  const CreatePostTextField({
    super.key,
    this.onSaved,
    required this.hintText,
    this.expands = false,
  });
  final Function(String?)? onSaved;
  final String hintText;
  final bool expands;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      style: Styles.styleBold18(context),
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      maxLines: null,
      textAlignVertical: TextAlignVertical.top,
      expands: expands,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xff364153),
        border: textFieldBorder(),
        enabledBorder: textFieldBorder(),
        hintText: hintText,
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
