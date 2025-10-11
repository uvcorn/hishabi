import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hishabi/core/localization/string_extension.dart';
import 'package:hishabi/routes/app_routes.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/appbar/custom_appbar.dart';
import '../../../../core/widgets/texts_widgets/custom_text.dart';
import '../../../user/presentation/providers/user_provider.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});
  static const String routeName = '/user-list';

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Load all users when screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserProvider>().loadAllUsersOnly();
    });
  }

  Future<void> _selectUser(String username) async {
    setState(() => _isLoading = true);

    try {
      await context.read<UserProvider>().setActiveUser(username);
      // await Future.delayed(const Duration(milliseconds: 200));

      if (!mounted) return;
      final userProvider = context.read<UserProvider>();

      if (userProvider.activeUser != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: CustomText(text: "User selected successfully"),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 1),
          ),
        );

        Navigator.of(
          context,
        ).pushNamedAndRemoveUntil(AppRoutes.navScreen, (route) => false);
      } else {
        throw Exception('Failed to set active user');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomText(text: "Error selecting user: $e"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    final allUsers = userProvider.allUsers;

    return WillPopScope(
      onWillPop: () async {
        // Prevent back navigation if no active user
        if (userProvider.activeUser == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: CustomText(text: "Please select a user to continue"),
              backgroundColor: Colors.orange,
            ),
          );
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              children: [
                CustomAppBar(isback: false, title: AppStrings.selectUser.tr),
                SizedBox(height: 10.h),

                // Info text
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.blue.shade700),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CustomText(
                          text: "Select a user to continue",
                          color: Colors.blue.shade700,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),

                // User List
                Expanded(
                  child: allUsers.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.people_outline,
                                size: 80,
                                color: Colors.grey.shade300,
                              ),
                              const SizedBox(height: 16),
                              CustomText(
                                text: "No users found",
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                              const SizedBox(height: 8),
                              CustomText(
                                text: "Create a user to get started",
                                color: Colors.grey.shade400,
                                fontSize: 13,
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: allUsers.length,
                          itemBuilder: (context, index) {
                            final user = allUsers[index];

                            return Card(
                              margin: const EdgeInsets.only(bottom: 12),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                onTap: _isLoading
                                    ? null
                                    : () => _selectUser(user.username),
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: AppColors.primary
                                      .withOpacity(0.1),
                                  backgroundImage:
                                      user.profilePicturePath != null
                                      ? FileImage(
                                          File(user.profilePicturePath!),
                                        )
                                      : null,
                                  child: user.profilePicturePath == null
                                      ? Icon(
                                          Icons.person,
                                          size: 32,
                                          color: AppColors.primary,
                                        )
                                      : null,
                                ),
                                title: CustomText(
                                  text: user.name,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: CustomText(
                                    text: "@${user.username}",
                                    fontSize: 13,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                trailing: _isLoading
                                    ? const SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : Icon(
                                        Icons.arrow_forward_ios,
                                        size: 18,
                                        color: Colors.grey.shade400,
                                      ),
                              ),
                            );
                          },
                        ),
                ),

                // Add User Button
                if (allUsers.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: TextButton.icon(
                      onPressed: _isLoading
                          ? null
                          : () {
                              // Navigate to create user screen
                              // Navigator.pushNamed(context, CreateUserScreen.routeName);
                            },
                      icon: const Icon(Icons.add),
                      label: const Text("Add New User"),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
