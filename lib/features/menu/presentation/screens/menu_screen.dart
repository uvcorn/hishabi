import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hishabi/core/localization/string_extension.dart';
import 'package:hishabi/routes/app_routes.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/image_widgets/custom_image.dart';
import '../../../../core/widgets/texts_widgets/custom_text.dart';
// import 'language_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});
  static const String routeName = '/menu-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('menu_title'.tr)),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CustomImage(
                  imageSrc: AppImages.homeTopBg,
                  sizeWidth: double.infinity,
                  sizeHeight: 310.h,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 80.h,
                  right: 16.w,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 4.h),
                          CustomText(
                            text: AppStrings.profile.tr,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                      SizedBox(width: 120.w),
                      Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white.withOpacity(0.2),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.notifications,
                            color: AppColors.white,
                            size: 22.r,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -40.h,
                  left: 0,
                  right: 0,
                  child: Center(
                    // Center the container horizontally
                    child: Container(
                      height: 140.h,
                      width: 140.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, -2),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: CustomImage(
                          imageSrc: AppImages.profile,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 56.h),
            Center(
              child: CustomText(
                text: AppStrings.userName.tr,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Column(
                children: [
                  CustomTileRow(
                    icon: Icons.edit,
                    title: AppStrings.editProfile.tr,
                    onTap: () {},
                  ),
                  SizedBox(height: 16.h),
                  CustomTileRow(
                    icon: Icons.language,
                    title: AppStrings.changeLanguage.tr,
                    onTap: () async {
                      final changed = await Navigator.pushNamed(
                        context,
                        AppRoutes.language,
                      );
                      if (changed == true) {
                        (context as Element).markNeedsBuild();
                      }
                    },
                  ),
                  // SizedBox(height: 16.h),
                  // CustomTileRow(
                  //   icon: Icons.lock,
                  //   title: AppStrings.changePassword.tr,
                  // ),
                  // SizedBox(height: 16.h),
                  // CustomTileRow(
                  //   icon: Icons.language,
                  //   title: AppStrings.changeLanguage.tr,
                  // ),
                  // SizedBox(height: 16.h),
                  // CustomTileRow(
                  //   icon: Icons.logout,
                  //   title: AppStrings.logout.tr,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTileRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  const CustomTileRow({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: AppColors.black, size: 30.r),
          SizedBox(width: 20.w),
          CustomText(text: title, fontSize: 20.sp),
          // Spacer(),
          // Icon(Icons.arrow_forward_ios, color: AppColors.black, size: 20.r),
        ],
      ),
    );
  }
}
