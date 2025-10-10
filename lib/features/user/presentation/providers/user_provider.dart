import 'package:flutter/foundation.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';

class UserProvider extends ChangeNotifier {
  final UserRepository _repository;
  UserEntity? activeUser;
  List<UserEntity> allUsers = [];

  UserProvider(this._repository);

  Future<void> init() async {
    activeUser = await _repository.getActiveUser();
    allUsers = await _repository.getAllUsers();
    notifyListeners();
  }

  Future<void> addUser(String name) async {
    await _repository.createUser(name);
    await init();
  }

  Future<void> updateUserName(String newName) async {
    if (activeUser == null) return;
    await _repository.updateUserName(activeUser!.username, newName);
    await init();
  }

  Future<void> updateProfilePicture(String path) async {
    if (activeUser == null) return;
    await _repository.updateProfilePicture(activeUser!.username, path);
    await init();
  }

  Future<void> setPassword(String password) async {
    if (activeUser == null) return;
    await _repository.setPassword(activeUser!.username, password);
    await init();
  }

  Future<void> deleteActiveUser() async {
    if (activeUser == null) return;
    await _repository.deleteUser(activeUser!.username);
    await init();
  }

  Future<void> setActiveUser(String username) async {
    await _repository.setActiveUser(username);
    await init();
  }

  Future<bool> verifyPassword(String password) async {
    if (activeUser == null) return false;
    return _repository.verifyPassword(activeUser!.username, password);
  }
}
