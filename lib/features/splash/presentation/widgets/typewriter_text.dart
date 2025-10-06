import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';

class TypewriterText extends StatelessWidget {
  final String text;
  final Animation<double> animation;
  const TypewriterText({
    super.key,
    required this.text,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) {
        int length = text.length;
        int currentIndex = (animation.value * length).toInt();
        String visible = text.substring(0, currentIndex);
        return RichText(
          text: TextSpan(
            style: GoogleFonts.poppins(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
              height: 1,
            ),
            children: [
              TextSpan(text: visible),
              // if (currentIndex == length)
              //   const TextSpan(
              //     text: ".",
              //     style: TextStyle(color: Colors.red, fontSize: 40),
              //   ),
            ],
          ),
        );
      },
    );
  }
}
