import 'package:hive/hive.dart';
import '../models/user_model.dart';

abstract class UserLocalDataSource {
  Future<void> createUser(UserModel user);
  Future<void> updateUser(UserModel user);
  Future<UserModel?> getUser(String username);
  Future<List<UserModel>> getAllUsers();
  Future<void> deleteUser(String username);
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final Box<UserModel> usersBox;

  UserLocalDataSourceImpl(this.usersBox);

  @override
  Future<void> createUser(UserModel user) async =>
      await usersBox.put(user.username, user);

  @override
  Future<void> updateUser(UserModel user) async => await user.save();

  @override
  Future<UserModel?> getUser(String username) async => usersBox.get(username);

  @override
  Future<List<UserModel>> getAllUsers() async => usersBox.values.toList();

  @override
  Future<void> deleteUser(String username) async =>
      await usersBox.delete(username);
}
