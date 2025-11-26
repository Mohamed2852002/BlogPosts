import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/services/service_locator.dart';
import 'package:social_app/features/home/domain/repositories/posts_repo.dart';
import 'package:social_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:social_app/features/home/presentation/widgets/post_creation_view_widgets/post_creation_view_body.dart';

class PostCreationView extends StatelessWidget {
  const PostCreationView({super.key});
  static const String routeName = 'postCreation';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create New Post'), centerTitle: true),
      body: BlocProvider(
        create: (context) => HomeCubit(postsRepo: getIt<PostsRepo>()),
        child: const PostCreationViewBody(),
      ),
    );
  }
}
