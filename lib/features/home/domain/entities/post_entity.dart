class PostEntity {
  final int? id;
  final String? title;
  final String? content;
  final String? image;
  final int? userId;
  final String? userName;
  final String? userFirstName;
  final String? userLastName;
  final String? userProfilePicture;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? likesCount;
  final List<int> likes;

  PostEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.image,
    required this.userId,
    required this.userName,
    required this.userFirstName,
    required this.userLastName,
    required this.userProfilePicture,
    required this.createdAt,
    required this.updatedAt,
    required this.likesCount,
    required this.likes,
  });
}
