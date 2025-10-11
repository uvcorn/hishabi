import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';
import '../texts_widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  final bool isback;
  final String title;
  const CustomAppBar({super.key, required this.title, this.isback = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isback == true)
          GestureDetector(
            onTap: () => Navigator.pop(context, true),
            child: Icon(Icons.arrow_back_ios, color: AppColors.black),
          ),
        SizedBox(width: 100.w),
        CustomText(text: title, fontSize: 20.sp),
      ],
    );
  }
}
