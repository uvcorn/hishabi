import 'package:hive/hive.dart';
import '../../domain/entities/user_entity.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String username;

  @HiveField(1)
  String name;

  @HiveField(2)
  String? profilePicturePath;

  @HiveField(3)
  String? passwordHash;

  UserModel({
    required this.username,
    required this.name,
    this.profilePicturePath,
    this.passwordHash,
  });

  UserEntity toEntity() => UserEntity(
    username: username,
    name: name,
    profilePicturePath: profilePicturePath,
    passwordHash: passwordHash,
  );
}
