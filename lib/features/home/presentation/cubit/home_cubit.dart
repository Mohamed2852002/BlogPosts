import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/features/home/domain/entities/post_entity.dart';
import 'package:social_app/features/home/domain/repositories/posts_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  bool thereIsNewPosts = false;
  String? nextUrl;

  final PostsRepo postsRepo;
  HomeCubit({required this.postsRepo}) : super(HomeInitial());

  getAllPosts({String? getPostsEndpoint}) async {
    emit(HomeLoading());
    final nextUrl = await postsRepo.getNextUrl(
      getPostsEndpoint: getPostsEndpoint,
    );
    nextUrl.fold(
      (failure) => emit(HomeFailure(errorMessage: failure.errorMessage)),
      (nextUrl) {
        thereIsNewPosts = nextUrl != null;
        this.nextUrl = nextUrl;
      },
    );

    final result = await postsRepo.getAllPosts(
      getPostsEndpoint: getPostsEndpoint,
    );
    return result.fold(
      (failure) => emit(HomeFailure(errorMessage: failure.errorMessage)),
      (posts) {
        emit(HomeSuccess(posts: posts));
      },
    );
  }

  Future<void> getNextPosts() async {
    emit(GetNewPostsLoading());
    if (!thereIsNewPosts) {
      emit(GetNewPostsSuccess());
      return;
    }
    final nextUrl = await postsRepo.getNextUrl(getPostsEndpoint: this.nextUrl);

    final result = await postsRepo.getAllPosts(getPostsEndpoint: this.nextUrl);
    return result.fold(
      (failure) => emit(HomeFailure(errorMessage: failure.errorMessage)),
      (posts) {
        emit(HomeSuccess(posts: posts));
        nextUrl.fold(
          (failure) => emit(HomeFailure(errorMessage: failure.errorMessage)),
          (nextUrl) {
            thereIsNewPosts = nextUrl != null;
            this.nextUrl = nextUrl;
          },
        );
      },
    );
  }

  createPost({
    required String title,
    required String content,
    File? image,
  }) async {
    emit(HomeLoading());
    final result = await postsRepo.createPost(
      title: title,
      content: content,
      image: image,
    );
    return result.fold(
      (failure) => emit(HomeFailure(errorMessage: failure.errorMessage)),
      (_) => emit(CreatePostSuccess()),
    );
  }

  likeOrUnlikePost({required int postId}) async {
    emit(LikeOrUnlikePostLoading());
    final result = await postsRepo.likeOrUnlikePost(postId: postId);
    return result.fold(
      (failure) =>
          emit(LikeOrUnlikePostFailure(errorMessage: failure.errorMessage)),
      (_) => emit(LikeOrUnlikePostSuccess()),
    );
  }
}
