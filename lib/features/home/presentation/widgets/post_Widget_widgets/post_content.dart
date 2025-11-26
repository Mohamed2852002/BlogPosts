import 'package:flutter/material.dart';
import 'package:social_app/core/utils/styles.dart';

class PostContent extends StatelessWidget {
  const PostContent({super.key, required this.postContent});
  final String postContent;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Text(postContent, style: Styles.styleSemiBold18(context)),
    );
  }
}
