import 'package:flutter/material.dart';
import 'package:social_app/core/themes/app_colors.dart';
import 'package:social_app/features/home/domain/entities/post_entity.dart';
import 'package:social_app/features/home/presentation/widgets/post_Widget_widgets/post_content.dart';
import 'package:social_app/features/home/presentation/widgets/post_Widget_widgets/post_image.dart';
import 'package:social_app/features/home/presentation/widgets/post_Widget_widgets/post_react.dart';
import 'package:social_app/features/home/presentation/widgets/post_Widget_widgets/post_title.dart';
import 'package:social_app/features/home/presentation/widgets/post_Widget_widgets/user_info.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key, required this.postEntity});
  final PostEntity postEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey, width: 0.3),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserInfo(postEntity: postEntity),
          PostTitle(postTitle: postEntity.title ?? 'No Title'),
          PostContent(postContent: postEntity.content ?? 'No Content'),
          Visibility(
            replacement: const Divider(height: 0),
            visible: postEntity.image != null && postEntity.image!.isNotEmpty,
            child: PostImage(postImage: postEntity.image ?? 'No Image'),
          ),
          PostReact(postEntity: postEntity),
        ],
      ),
    );
  }
}
