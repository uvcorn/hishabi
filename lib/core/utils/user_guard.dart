import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../features/menu/presentation/screens/user_list_screen.dart';
import '../../features/user/presentation/providers/user_provider.dart';

/// Wrapper widget that automatically redirects to user selection
/// if no active user is found
class UserGuard extends StatefulWidget {
  final Widget child;
  final bool shouldCheckUser;

  const UserGuard({
    super.key,
    required this.child,
    this.shouldCheckUser = true,
  });

  @override
  State<UserGuard> createState() => _UserGuardState();
}

class _UserGuardState extends State<UserGuard> {
  bool _isRedirecting = false;

  void _redirectToUserList() {
    if (_isRedirecting) return;

    _isRedirecting = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil(UserListScreen.routeName, (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.shouldCheckUser) {
      return widget.child;
    }

    return Consumer<UserProvider>(
      builder: (context, userProvider, _) {
        // If user is null, redirect immediately
        if (userProvider.activeUser == null) {
          _redirectToUserList();

          // Show loading screen while redirecting
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // User exists, reset redirect flag and show content
        _isRedirecting = false;
        return widget.child;
      },
    );
  }
}

/// Mixin to add auto-redirect functionality to any StatefulWidget
mixin UserGuardMixin<T extends StatefulWidget> on State<T> {
  bool _hasCheckedUser = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_hasCheckedUser) {
      _hasCheckedUser = true;
      _checkUser();
    }
  }

  void _checkUser() {
    final userProvider = context.read<UserProvider>();

    if (userProvider.activeUser == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil(UserListScreen.routeName, (route) => false);
        }
      });
    }
  }

  /// Call this method to manually recheck user
  void recheckUser() {
    _hasCheckedUser = false;
    _checkUser();
  }
}

/// Extension method for easy checking in any widget
extension UserGuardExtension on BuildContext {
  /// Check if user is logged in, redirect if not
  void checkUserOrRedirect() {
    final userProvider = read<UserProvider>();

    if (userProvider.activeUser == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          Navigator.of(
            this,
          ).pushNamedAndRemoveUntil(UserListScreen.routeName, (route) => false);
        }
      });
    }
  }

  /// Check if user exists
  bool get hasActiveUser {
    final userProvider = read<UserProvider>();
    return userProvider.activeUser != null;
  }
}
