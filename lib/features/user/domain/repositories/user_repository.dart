import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<void> createUser(String name);
  Future<void> updateUserName(String oldUsername, String newName);
  Future<void> updateProfilePicture(String username, String path);
  Future<void> setPassword(String username, String password);
  Future<bool> verifyPassword(String username, String password);
  Future<void> deleteUser(String username);

  Future<UserEntity?> getActiveUser();
  Future<List<UserEntity>> getAllUsers();
  Future<void> setActiveUser(String username);
}
