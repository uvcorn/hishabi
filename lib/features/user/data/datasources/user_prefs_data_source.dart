import 'package:shared_preferences/shared_preferences.dart';

abstract class UserPrefsDataSource {
  Future<void> setActiveUser(String username);
  Future<String?> getActiveUser();
  Future<void> clearActiveUser();
}

class UserPrefsDataSourceImpl implements UserPrefsDataSource {
  static const _key = 'active_user';

  @override
  Future<void> setActiveUser(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, username);
  }

  @override
  Future<String?> getActiveUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key);
  }

  @override
  Future<void> clearActiveUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
