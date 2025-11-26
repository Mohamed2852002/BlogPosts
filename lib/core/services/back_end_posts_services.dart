import 'dart:developer';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path/path.dart';

import 'package:dio/dio.dart';
import 'package:social_app/core/services/api_services.dart';
import 'package:social_app/core/utils/constants.dart';
import 'package:social_app/features/home/data/models/post_model/post_model.dart';
import 'package:social_app/features/home/data/models/upload_credentials_model/upload_credentials_model.dart';
import 'package:social_app/features/home/domain/entities/post_entity.dart';

class BackEndPostsServices {
  final ApiServices apiServices;
  final FlutterSecureStorage storage;
  BackEndPostsServices({required this.apiServices, required this.storage});

  static const String getAllPostsEndpoint = '${baseUrl}posts/';
  static const String createPostEndpoint = '${baseUrl}posts/';
  static const String getUploadCredentialsEndpoint =
      '${baseUrl}uploads/presigned-url';
  static const String uploadImageEndpoint =
      'https://upload.uploadcare.com/base/';

  Future<List<PostEntity>> getAllPosts({String? getPostsEndpoint}) async {
    final response = await apiServices.get(
      getPostsEndpoint ?? getAllPostsEndpoint,
    );
    final List<PostEntity> posts =
        (response['data'] as List)
            .map((post) => PostModel.fromMap(post))
            .toList();

    return posts;
  }

  Future<String?> getNextUrl({String? getPostsEndpoint}) async {
    final response = await apiServices.get(
      getPostsEndpoint ?? getAllPostsEndpoint,
    );
    final String? nextPostsEndPoint = response['pagination']['next'];
    return nextPostsEndPoint;
  }

  Future<UploadCredentialsModel> getUploadCredentials() async {
    final String? accessToken = await storage.read(key: kAccessToken);
    final response = await apiServices.get(
      getUploadCredentialsEndpoint,
      accessToken: accessToken,
    );
    final UploadCredentialsModel uploadCredentialsModel =
        UploadCredentialsModel.fromJson(response['data']);
    return uploadCredentialsModel;
  }

  Future<String> uploadImage({
    required UploadCredentialsModel uploadCredentials,
    required File file,
  }) async {
    final String? accessToken = await storage.read(key: kAccessToken);
    final Map<String, dynamic> data = {
      'UPLOADCARE_PUB_KEY': uploadCredentials.pubKey,
      'UPLOADCARE_STORE': 'auto',
      'expire': uploadCredentials.expire,
      'signature': uploadCredentials.signature,
      'file': await MultipartFile.fromFile(
        file.path,
        filename: basename(file.path),
      ),
    };
    final formData = FormData.fromMap(data);
    final response = await apiServices.post(
      uploadImageEndpoint,
      formData,
      accessToken: accessToken,
    );
    return response['file'];
  }

  Future<void> createPost({
    required String title,
    required String content,
    File? image,
  }) async {
    final String? accessToken = await storage.read(key: kAccessToken);
    final uploadCredentials = await getUploadCredentials();
    final imageUrl =
        image == null
            ? null
            : await uploadImage(
              uploadCredentials: uploadCredentials,
              file: image,
            );
    final Map<String, dynamic> data = {
      'title': title,
      'content': content,
      'image': imageUrl,
    };
    final response = await apiServices.post(
      createPostEndpoint,
      data,
      accessToken: accessToken,
    );
    log(response.toString());
  }

  Future<void> likeOrUnlikePost({required int postId}) async {
    final String? accessToken = await storage.read(key: kAccessToken);
    await apiServices.post(
      '${baseUrl}posts/$postId/like',
      {},
      accessToken: accessToken,
    );
  }
}
