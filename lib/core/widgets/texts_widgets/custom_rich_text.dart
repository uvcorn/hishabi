import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';

class CustomRichText extends StatelessWidget {
  final String firstText; // The first text (e.g., "Don't have an account?")
  final String secondText; // The clickable text (e.g., "Sign Up")
  final Color firstTextColor; // Color of the first text
  final Color secondTextColor; // Color of the link text
  final double fontSize;
  final VoidCallback onTap;
  final bool isSlash;

  const CustomRichText({
    super.key,
    required this.firstText,
    required this.secondText,
    this.firstTextColor = AppColors.greenish,
    this.secondTextColor = AppColors.red,
    this.fontSize = 14.0,
    required this.onTap,
    this.isSlash = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        maxLines: 2,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: firstText,
              style: TextStyle(
                color: firstTextColor,
                fontWeight: FontWeight.w600,
                fontSize: fontSize.sp,
              ),
            ),
            if (isSlash == true)
              TextSpan(
                text: " / ",
                style: TextStyle(
                  color: Colors.grey, // second color (separator)
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

            TextSpan(
              text: secondText,
              style: TextStyle(
                color: secondTextColor,
                fontSize: fontSize.sp,
                fontWeight: FontWeight.w600,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
