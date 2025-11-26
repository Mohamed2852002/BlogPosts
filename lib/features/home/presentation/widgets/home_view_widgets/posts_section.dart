import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/functions/show_custom_snack_bar.dart';
import 'package:social_app/core/utils/styles.dart';
import 'package:social_app/features/home/domain/entities/post_entity.dart';
import 'package:social_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:social_app/features/home/presentation/widgets/home_view_widgets/post_widget.dart';

class PostsSection extends StatefulWidget {
  const PostsSection({super.key});

  @override
  State<PostsSection> createState() => _PostsSectionState();
}

class _PostsSectionState extends State<PostsSection> {
  List<PostEntity> posts = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeSuccess) {
          posts.addAll(state.posts);
        }
        if (state is GetNewPostsFailure) {
          showCustomSnackBar(
            context,
            state.errorMessage,
            backgroundColor: Colors.red,
          );
        }
      },
      builder: (context, state) {
        if (state is HomeFailure) {
          return SliverFillRemaining(
            child: Center(
              child: Text(
                state.errorMessage,
                style: Styles.styleBold18(context),
              ),
            ),
          );
        } else if (state is HomeLoading) {
          return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        } else {
          if (posts.isEmpty) {
            return SliverFillRemaining(
              child: Center(
                child: Text(
                  'No posts available',
                  style: Styles.styleBold18(context),
                ),
              ),
            );
          } else {
            return SliverList.separated(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return PostWidget(postEntity: posts[index]);
              },
              separatorBuilder: (context, index) => const SizedBox(height: 16),
            );
          }
        }
      },
    );
  }
}
