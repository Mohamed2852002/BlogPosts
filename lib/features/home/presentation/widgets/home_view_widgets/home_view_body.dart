import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/utils/styles.dart';
import 'package:social_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:social_app/features/home/presentation/widgets/home_view_widgets/posts_section.dart';
import 'package:social_app/features/home/presentation/widgets/home_view_widgets/welcome_widget.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late ScrollController scrollController;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(onScroll);
  }

  void onScroll() async {
    final double currentPosition = scrollController.position.pixels;
    final double maxScrollLength = scrollController.position.maxScrollExtent;
    if (currentPosition >= maxScrollLength / 2 && !isLoading) {
      if (context.read<HomeCubit>().thereIsNewPosts == false) return;
      isLoading = true;
      await context.read<HomeCubit>().getNextPosts().whenComplete(() {
        if (mounted) {
          isLoading = false;
        }
      });
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    scrollController.removeListener(onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: RefreshIndicator(
        onRefresh: () async {},
        child: CustomScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: 16,
              toolbarHeight: 0,
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  const WelcomeWidget(),
                  Text('Recent Posts', style: Styles.styleBold26(context)),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            const PostsSection(),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'You\'re all caught up',
                  style: Styles.styleBold18(context),
                ),
              ),
            ),
            const SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: 16,
              toolbarHeight: 0,
            ),
          ],
        ),
      ),
    );
  }
}
