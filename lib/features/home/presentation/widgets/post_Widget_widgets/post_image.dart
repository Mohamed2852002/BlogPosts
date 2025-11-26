import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {
  const PostImage({super.key, required this.postImage});
  final String postImage;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: postImage,
      placeholder:
          (context, url) => const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      fit: BoxFit.cover,
      width: double.infinity,
      height: 180,
    );
  }
}
