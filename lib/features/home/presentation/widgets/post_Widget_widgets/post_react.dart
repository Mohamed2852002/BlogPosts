import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/themes/app_colors.dart';
import 'package:social_app/core/utils/boxes/boxes.dart';
import 'package:social_app/core/utils/styles.dart';
import 'package:social_app/features/home/domain/entities/post_entity.dart';
import 'package:social_app/features/home/presentation/cubit/home_cubit.dart';

class PostReact extends StatefulWidget {
  const PostReact({super.key, required this.postEntity});
  final PostEntity postEntity;

  @override
  State<PostReact> createState() => _PostReactState();
}

class _PostReactState extends State<PostReact> {
  bool isLike = false;
  late int likeCount;

  @override
  void initState() {
    final userEntity = userBox.get(0);
    final likeList = widget.postEntity.likes;
    isLike = likeList.contains(userEntity?.userId);
    likeCount = widget.postEntity.likesCount ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        children: [
          IconButton(
            tooltip: 'Like',
            onPressed: () {
              setState(() {
                isLike = !isLike;
                context.read<HomeCubit>().likeOrUnlikePost(
                  postId: widget.postEntity.id ?? 0,
                );
                if (isLike) {
                  likeCount++;
                } else {
                  likeCount--;
                }
              });
            },
            icon:
                isLike
                    ? const Icon(Icons.favorite, color: Colors.red)
                    : const Icon(Icons.favorite_border, color: Colors.grey),
          ),
          Text(
            '$likeCount',
            style: Styles.styleSemiBold16(context).copyWith(color: Colors.grey),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Text(
                  'Read More',
                  style: Styles.styleSemiBold16(
                    context,
                  ).copyWith(color: AppColors.buttonColor),
                ),
                const SizedBox(width: 6),
                const Icon(Icons.arrow_forward, color: AppColors.buttonColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
