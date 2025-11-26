import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:social_app/core/errors/custom_exceptions.dart';
import 'package:social_app/core/errors/failure.dart';
import 'package:social_app/core/services/back_end_posts_services.dart';
import 'package:social_app/features/home/domain/entities/post_entity.dart';
import 'package:social_app/features/home/domain/repositories/posts_repo.dart';

class PostsRepoImpl extends PostsRepo {
  BackEndPostsServices backEndPostsServices;
  PostsRepoImpl({required this.backEndPostsServices});
  @override
  Future<Either<Failure, List<PostEntity>>> getAllPosts({
    String? getPostsEndpoint,
  }) async {
    try {
      final posts = await backEndPostsServices.getAllPosts(
        getPostsEndpoint: getPostsEndpoint,
      );
      return right(posts);
    } on DioException catch (e) {
      log('Dio Error in PostsRepoImpl.getAllPosts: ${e.message}');
      return left(ServerFailure.fromDioException(e));
    } on CustomException catch (e) {
      log('Error in PostsRepoImpl.getAllPosts: ${e.toString()}');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String?>> getNextUrl({
    String? getPostsEndpoint,
  }) async {
    try {
      final nextUrl = await backEndPostsServices.getNextUrl(
        getPostsEndpoint: getPostsEndpoint,
      );
      return right(nextUrl);
    } on DioException catch (e) {
      log('Dio Error in PostsRepoImpl.getNextUrl: ${e.message}');
      return left(ServerFailure.fromDioException(e));
    } on CustomException catch (e) {
      log('Error in PostsRepoImpl.getNextUrl: ${e.toString()}');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> createPost({
    required String title,
    required String content,
    File? image,
  }) async {
    try {
      await backEndPostsServices.createPost(
        title: title,
        content: content,
        image: image,
      );
      return right(unit);
    } on DioException catch (e) {
      log('Dio Error in PostsRepoImpl.createPost: ${e.message}');
      return left(ServerFailure.fromDioException(e));
    } on CustomException catch (e) {
      log('Error in PostsRepoImpl.createPost: ${e.toString()}');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> likeOrUnlikePost({required int postId}) async {
    try {
      backEndPostsServices.likeOrUnlikePost(postId: postId);
      return right(unit);
    } on DioException catch (e) {
      log('Dio Error in PostsRepoImpl.likeOrUnlikePost: ${e.message}');
      return left(ServerFailure.fromDioException(e));
    } on CustomException catch (e) {
      log('Error in PostsRepoImpl.likeOrUnlikePost: ${e.toString()}');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
