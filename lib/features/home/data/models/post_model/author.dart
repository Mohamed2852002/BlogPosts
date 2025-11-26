class Author {
  final int? id;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? profilePicture;

  const Author({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.profilePicture,
  });

  factory Author.fromMap(Map<String, dynamic> data) => Author(
    id: data['id'] as int?,
    username: data['username'] as String?,
    firstName: data['first_name'] as String?,
    lastName: data['last_name'] as String?,
    profilePicture: data['profile_picture'] as String?,
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'username': username,
    'first_name': firstName,
    'last_name': lastName,
    'profile_picture': profilePicture,
  };
}
