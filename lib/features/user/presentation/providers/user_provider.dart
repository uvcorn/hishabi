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

  // Load only the user list without setting active user
  Future<void> loadAllUsersOnly() async {
    allUsers = await _repository.getAllUsers();
    notifyListeners();
  }

  // Clear active user and navigate to user selection
  Future<void> clearActiveUser() async {
    await _repository.clearActiveUser();
    activeUser = null;
    notifyListeners();
  }

  Future<void> addUser(String name) async {
    await _repository.createUser(name);
    await init();
  }

  Future<void> updateUserName(String newName) async {
    if (activeUser == null) {
      throw Exception('No active user');
    }
    await _repository.updateUserName(activeUser!.username, newName);
    await init(); // Refresh the data
  }

  Future<void> updateProfilePicture(String path) async {
    if (activeUser == null) {
      throw Exception('No active user');
    }
    await _repository.updateProfilePicture(activeUser!.username, path);
    await init(); // Refresh the data
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
    // Save active username in SharedPreferences
    await _repository.setActiveUser(username);

    // Fetch the actual UserEntity from Hive
    final user = await _repository.getUserByUsername(username);
    if (user == null) {
      throw Exception("Failed to find the user after setting active");
    }

    activeUser = user;
    notifyListeners();
  }

  Future<bool> verifyPassword(String password) async {
    if (activeUser == null) return false;
    return _repository.verifyPassword(activeUser!.username, password);
  }
}
