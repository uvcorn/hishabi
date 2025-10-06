import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hishabi/core/widgets/bottom_nav_bar/nav_screen.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/button_widgets/custom_elevated_button.dart';
import '../../../../core/widgets/image_widgets/custom_image.dart';
import '../../../../core/widgets/texts_widgets/custom_checkbox.dart';
import '../../../../core/widgets/texts_widgets/custom_text.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = '/onboarding';
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CustomImage(
                imageSrc: AppImages.onboardBg,
                sizeWidth: double.infinity,
                sizeHeight: 600.h,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 80, // move down 80 pixels from top
                child: CustomImage(
                  imageSrc: AppImages.man,
                  sizeWidth: 280,
                  sizeHeight: 460.h,
                ),
              ),
            ],
          ),
          CustomText(
            text: AppStrings.onboardingTitle,
            maxLines: 2,
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
            bottom: 0, // <-- ensure no bottom padding
          ),
          CustomText(
            text: AppStrings.onboardingSubTitle,
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
            top: 0, // <-- ensure no top padding
          ),
          SizedBox(height: 40.h),
          CustomElevatedButton(
            width: 358,
            height: 60,
            borderRadius: BorderRadius.circular(12),
            text: AppStrings.getStarted,
            onPressed: () {
              Navigator.pushReplacementNamed(context, NavScreen.routeName);
            },
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomCheckbox(
                leadingText: AppStrings.alreadyHaveAccount,
                clickableText: AppStrings.logIn,
                clickableColor: AppColors.primary,
                fontWeight: FontWeight.w600,

                onLinkTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
