import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hishabi/core/widgets/image_widgets/custom_image.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/texts_widgets/custom_text.dart';

class LanguageOptionTile extends StatelessWidget {
  final String image;
  final String label;
  final bool isSelected;
  final bool isEnabled;
  final VoidCallback onTap;

  const LanguageOptionTile({
    super.key,
    required this.image,
    required this.label,
    required this.isSelected,
    this.isEnabled = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        height: 70.h,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withOpacity(0.05)
              : AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.mediumGray,
            width: isSelected ? 2.5.w : 1.5.w,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              // Flag Container with better proportions
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.mediumGray.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: ClipOval(
                  child: CustomImage(
                    imageSrc: image,
                    sizeWidth: 40.w,
                    sizeHeight: 40.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(width: 16.w),

              // Language Label
              Expanded(
                child: CustomText(
                  text: label,
                  fontSize: 18,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isSelected ? AppColors.primary : AppColors.black,
                ),
              ),

              // Checkmark icon when selected
              if (isSelected)
                Icon(Icons.check_circle, color: AppColors.primary, size: 24.r),
            ],
          ),
        ),
      ),
    );
  }
}
