import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../features/menu/presentation/screens/user_list_screen.dart';
import '../../features/user/presentation/providers/user_provider.dart';

/// Helper class to handle user navigation from anywhere in the app
class UserNavigationHelper {
  /// Clear active user and navigate to user selection screen
  /// This removes all routes from the stack
  static Future<void> navigateToUserSelection(BuildContext context) async {
    try {
      // Clear the active user
      await context.read<UserProvider>().clearActiveUser();

      // Navigate to user selection screen and clear navigation stack
      if (context.mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          UserListScreen.routeName,
          (route) => false, // Remove all previous routes
        );
      }
    } catch (e) {
      debugPrint('Error navigating to user selection: $e');
    }
  }

  /// Switch user (clears active user and shows selection)
  /// Alias for navigateToUserSelection
  static Future<void> switchUser(BuildContext context) async {
    await navigateToUserSelection(context);
  }

  /// Logout current user (same as switch user)
  static Future<void> logout(BuildContext context) async {
    await navigateToUserSelection(context);
  }
}

/// Extension method for easier access
extension UserNavigationExtension on BuildContext {
  /// Quick access to navigate to user selection
  Future<void> navigateToUserSelection() async {
    await UserNavigationHelper.navigateToUserSelection(this);
  }

  /// Quick access to switch user
  Future<void> switchUser() async {
    await UserNavigationHelper.switchUser(this);
  }

  /// Quick access to logout
  Future<void> logout() async {
    await UserNavigationHelper.logout(this);
  }
}
