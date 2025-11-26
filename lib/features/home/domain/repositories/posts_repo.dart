import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:social_app/core/errors/failure.dart';
import 'package:social_app/features/home/domain/entities/post_entity.dart';

abstract class PostsRepo {
  Future<Either<Failure, List<PostEntity>>> getAllPosts({String? getPostsEndpoint});
  Future<Either<Failure,String?>> getNextUrl({String? getPostsEndpoint});
  Future<Either<Failure, Unit>> createPost({
    required String title,
    required String content,
    File? image,
  });

  Future<Either<Failure, Unit>> likeOrUnlikePost({required int postId});
}
