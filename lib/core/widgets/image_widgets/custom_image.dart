// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomImage extends StatelessWidget {
  final String? imageSrc; // Make imageSrc nullable
  final File? imageFile; // New parameter for File
  final Color? imageColor;
  final double? size;
  final double? sizeWidth;
  final double? sizeHeight;
  final BoxFit? fit;
  final double horizontal;
  final double vertical;

  const CustomImage({
    this.imageSrc,
    this.imageFile,
    this.imageColor,
    this.size,
    this.sizeWidth,
    this.sizeHeight,
    this.fit,
    this.horizontal = 0.0,
    this.vertical = 0.0,
    super.key,
  }) : assert(
         imageSrc != null || imageFile != null,
         'imageSrc or imageFile must not be null',
       );

  bool get _isSvg =>
      imageSrc != null && imageSrc!.toLowerCase().endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    final double? width = sizeWidth ?? size;
    final double? height = sizeHeight ?? size;
    final BoxFit imageFit = fit ?? BoxFit.contain;

    Widget imageWidget;

    if (imageFile != null) {
      imageWidget = Image.file(
        imageFile!,
        width: width,
        height: height,
        fit: imageFit,
      );
    } else if (_isSvg) {
      imageWidget = SvgPicture.asset(
        imageSrc!,
        color: imageColor,
        width: width,
        height: height,
        fit: imageFit,
      );
    } else {
      imageWidget = Image.asset(
        imageSrc!,
        color: imageColor,
        width: width,
        height: height,
        fit: imageFit,
        alignment: Alignment.topCenter,
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horizontal.w,
        vertical: vertical.h,
      ),
      child: imageWidget,
    );
  }
}
