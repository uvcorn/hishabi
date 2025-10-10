import 'dart:convert';
import 'package:crypto/crypto.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_local_data_source.dart';
import '../datasources/user_prefs_data_source.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource localDataSource;
  final UserPrefsDataSource prefsDataSource;

  UserRepositoryImpl({
    required this.localDataSource,
    required this.prefsDataSource,
  });

  @override
  Future<void> createUser(String name) async {
    final username = _generateUsername(name);
    final allUsers = await localDataSource.getAllUsers();
    final uniqueUsername = _makeUniqueUsername(allUsers, username);
    final user = UserModel(username: uniqueUsername, name: name);
    await localDataSource.createUser(user);
  }

  @override
  Future<void> updateUserName(String oldUsername, String newName) async {
    final user = await localDataSource.getUser(oldUsername);
    if (user == null) return;
    final base = _generateUsername(newName);
    final allUsers = await localDataSource.getAllUsers();
    final unique = _makeUniqueUsername(allUsers, base);
    user.name = newName;
    user.username = unique;
    await localDataSource.updateUser(user);

    final active = await prefsDataSource.getActiveUser();
    if (active == oldUsername) await prefsDataSource.setActiveUser(unique);
  }

  @override
  Future<void> updateProfilePicture(String username, String path) async {
    final user = await localDataSource.getUser(username);
    if (user == null) return;
    user.profilePicturePath = path;
    await localDataSource.updateUser(user);
  }

  @override
  Future<void> setPassword(String username, String password) async {
    final user = await localDataSource.getUser(username);
    if (user == null) return;
    user.passwordHash = _hash(password);
    await localDataSource.updateUser(user);
  }

  @override
  Future<bool> verifyPassword(String username, String password) async {
    final user = await localDataSource.getUser(username);
    if (user == null || user.passwordHash == null) return false;
    return user.passwordHash == _hash(password);
  }

  @override
  Future<void> deleteUser(String username) async {
    await localDataSource.deleteUser(username);
    final active = await prefsDataSource.getActiveUser();
    if (active == username) await prefsDataSource.clearActiveUser();
  }

  @override
  Future<UserEntity?> getActiveUser() async {
    final username = await prefsDataSource.getActiveUser();
    if (username == null) return null;
    final user = await localDataSource.getUser(username);
    return user?.toEntity();
  }

  @override
  Future<List<UserEntity>> getAllUsers() async {
    final users = await localDataSource.getAllUsers();
    return users.map((u) => u.toEntity()).toList();
  }

  @override
  Future<void> setActiveUser(String username) async =>
      prefsDataSource.setActiveUser(username);

  // Helpers
  String _generateUsername(String name) =>
      name.trim().toLowerCase().replaceAll(' ', '_');

  String _makeUniqueUsername(List<UserModel> users, String base) {
    var username = base;
    var count = 1;
    while (users.any((u) => u.username == username)) {
      username = '${base}_$count';
      count++;
    }
    return username;
  }

  String _hash(String input) => sha256.convert(utf8.encode(input)).toString();
}
