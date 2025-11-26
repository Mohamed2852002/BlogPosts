import 'package:social_app/features/home/domain/entities/post_entity.dart';
import 'author.dart';

class PostModel extends PostEntity {
  final Author? author;

  PostModel({
    required super.id,
    required super.title,
    required super.content,
    required super.image,
    required super.createdAt,
    required super.updatedAt,
    required super.likesCount,
    required super.likes,
    required this.author,
  }) : super(
         userId: author?.id,
         userName: author?.username,
         userFirstName: author?.firstName,
         userLastName: author?.lastName,
         userProfilePicture: author?.profilePicture,
       );

  factory PostModel.fromMap(Map<String, dynamic> data) => PostModel(
    id: data['id'] as int?,
    title: data['title'] as String?,
    author:
        data['author'] == null
            ? null
            : Author.fromMap(data['author'] as Map<String, dynamic>),
    content: data['content'] as String?,
    image: data['image'] as String?,
    createdAt:
        data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
    updatedAt:
        data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
    likesCount: data['likes_count'] as int?,
    likes:
        data['likes'] == null ? <int>[] : List<int>.from(data['likes'] as List),
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'author': author?.toMap(),
    'content': content,
    'image': image,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
    'likes_count': likesCount,
    'likes': likes,
  };
}
