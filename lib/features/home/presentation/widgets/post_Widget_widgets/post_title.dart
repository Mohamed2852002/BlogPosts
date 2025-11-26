import 'package:flutter/material.dart';
import 'package:social_app/core/utils/styles.dart';

class PostTitle extends StatelessWidget {
  const PostTitle({super.key, required this.postTitle});
  final String postTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Text(postTitle, style: Styles.styleBold22(context)),
    );
  }
}
