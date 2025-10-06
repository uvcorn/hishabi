import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_colors.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    this.maxLines,
    this.textAlign = TextAlign.center,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.color = AppColors.black,
    required this.text,
    this.overflow = TextOverflow.visible,
    this.decoration,
    this.fontFamily,
  });

  final double left;
  final double right;
  final double top;
  final double bottom;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final String text;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow overflow;
  final TextDecoration? decoration;
  final String? fontFamily;
  @override
  Widget build(BuildContext context) {
    final String actualFontFamily = fontFamily ?? 'Roboto';

    return Padding(
      padding: EdgeInsets.only(
        left: left.w,
        right: right.w,
        top: top.h,
        bottom: bottom.h,
      ),
      child: Text(
        textAlign: textAlign,
        text,
        maxLines: maxLines,
        overflow: overflow,
        style: GoogleFonts.getFont(
          actualFontFamily,
          fontSize: fontSize.sp,
          fontWeight: fontWeight,
          color: color,
          decoration: decoration,
          decorationColor: Colors.black,
          decorationThickness: 2,
        ),
      ),
    );
  }
}
