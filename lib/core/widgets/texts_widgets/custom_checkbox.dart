import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';
import '../texts_widgets/custom_text.dart'; // Import your CustomText

class CustomCheckbox extends StatelessWidget {
  final bool? showCheckbox;
  final bool? value;
  final ValueChanged<bool?>? onChanged;

  final String leadingText;
  final FontWeight fontWeight;
  final Color leadingColor;

  final String clickableText;
  final double clickableLeft;
  final double clickableRight;
  final double clickableTop;
  final double clickableBottom;
  final double fontSize;
  final Color clickableColor;

  final VoidCallback onLinkTap;
  final bool useSpaceBetweenAlignment;
  final bool centerAlignment;

  const CustomCheckbox({
    super.key,
    this.showCheckbox,
    this.value,
    this.onChanged,
    required this.leadingText,
    this.fontWeight = FontWeight.normal,
    this.leadingColor = Colors.black,
    required this.clickableText,
    this.clickableLeft = 0,
    this.clickableRight = 0,
    this.clickableTop = 0,
    this.clickableBottom = 0,
    this.fontSize = 14,
    this.clickableColor = AppColors.primary,
    required this.onLinkTap,
    this.useSpaceBetweenAlignment = false,
    this.centerAlignment = false,
  });

  @override
  Widget build(BuildContext context) {
    final MainAxisAlignment mainRowAlignment = useSpaceBetweenAlignment
        ? MainAxisAlignment.spaceBetween
        : (centerAlignment
              ? MainAxisAlignment.center
              : MainAxisAlignment.start);

    final bool shouldShowCheckbox =
        showCheckbox == true && value != null && onChanged != null;

    return Row(
      mainAxisAlignment: mainRowAlignment,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (shouldShowCheckbox)
              Checkbox(
                value: value,
                onChanged: onChanged,
                activeColor: AppColors.primary,
                checkColor: Colors.white,
              ),
            CustomText(
              text: leadingText,
              fontSize: fontSize.sp,
              fontWeight: fontWeight,
              color: leadingColor,
            ),
          ],
        ),

        if (!useSpaceBetweenAlignment) SizedBox(width: 4.w),

        if (useSpaceBetweenAlignment) const Spacer(),

        GestureDetector(
          onTap: onLinkTap,
          child: CustomText(
            text: clickableText,
            fontSize: fontSize.sp,
            fontWeight: fontWeight,
            color: clickableColor,
          ),
        ),
      ],
    );
  }
}
