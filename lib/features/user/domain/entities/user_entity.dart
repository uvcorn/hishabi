class UserEntity {
  final String username;
  final String name;
  final String? profilePicturePath;
  final String? passwordHash;

  const UserEntity({
    required this.username,
    required this.name,
    this.profilePicturePath,
    this.passwordHash,
  });

  bool get hasPassword => passwordHash != null && passwordHash!.isNotEmpty;
}
