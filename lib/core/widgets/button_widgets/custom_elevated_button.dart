import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../texts_widgets/custom_text.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final BorderRadiusGeometry borderRadius;
  final Color backgroundColor;
  // final Color shadowColor;
  // final double elevation;
  final EdgeInsetsGeometry padding;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.borderRadius,
    this.backgroundColor = AppColors.primary,

    // required this.shadowColor,
    // required this.elevation,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.textColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
          // boxShadow: [
          //   BoxShadow(
          //     color: shadowColor,
          //     blurRadius: elevation,
          //     offset: Offset(0, elevation / 2),
          //   ),
          // ],
        ),
        alignment: Alignment.center,
        child: CustomText(
          text: text,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        ),
      ),
    );
  }
}
