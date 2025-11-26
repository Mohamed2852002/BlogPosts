import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:social_app/core/utils/assets_manager.dart';
import 'package:social_app/core/utils/styles.dart';
import 'package:social_app/features/home/domain/entities/post_entity.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key, required this.postEntity});
  final PostEntity postEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        spacing: 16,
        children: [
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
              postEntity.userProfilePicture ?? AssetsManager.imagesProfileImage,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${postEntity.userFirstName ?? ''} ${postEntity.userLastName ?? ''}'
                        .trim()
                        .isEmpty
                    ? 'User'
                    : '${postEntity.userFirstName ?? ''} ${postEntity.userLastName ?? ''}',
                style: Styles.styleBold18(context),
              ),
              Text(
                postEntity.createdAt != null
                    ? postEntity.createdAt!.toLocal().toString().split(' ')[0]
                    : 'Unknown date',
                style: Styles.styleBold14(context).copyWith(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
