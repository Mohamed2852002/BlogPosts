import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:social_app/core/services/service_locator.dart';
import 'package:social_app/core/themes/app_colors.dart';
import 'package:social_app/core/utils/boxes/boxes.dart';
import 'package:social_app/core/utils/styles.dart';
import 'package:social_app/features/auth/domain/entities/user_entity.dart';
import 'package:social_app/features/auth/presentation/pages/sign_in_view.dart';
import 'package:social_app/features/home/domain/repositories/posts_repo.dart';
import 'package:social_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:social_app/features/home/presentation/pages/post_creation_view.dart';
import 'package:social_app/features/home/presentation/widgets/home_view_widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.userEntity});
  static const String routeName = 'home';
  final UserEntity userEntity;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => HomeCubit(postsRepo: getIt<PostsRepo>())..getAllPosts(),
      child: Scaffold(
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, PostCreationView.routeName).then((
                  result,
                ) {
                  if (result == true) {
                    // ignore: use_build_context_synchronously
                    context.read<HomeCubit>().getAllPosts();
                  }
                });
              },
              tooltip: 'Add Post',
              backgroundColor: AppColors.buttonColor,
              child: const Icon(Icons.add),
            );
          },
        ),
        appBar: AppBar(
          title: const Row(
            spacing: 4,
            children: [
              Icon(Icons.home, color: AppColors.primary),
              Text('BlogPosts'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                getIt<FlutterSecureStorage>().deleteAll();
                userBox.clear();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  SignInView.routeName,
                  (route) => false,
                );
              },
              child: Text(
                'Logout',
                style: Styles.styleBold18(context).copyWith(color: Colors.red),
              ),
            ),
          ],
        ),
        body: const HomeViewBody(),
      ),
    );
  }
}
