import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hishabi/core/constants/app_icons.dart';
import 'package:provider/provider.dart';
import 'package:hishabi/core/localization/string_extension.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/localization/language_provider.dart';
import '../../../../core/widgets/texts_widgets/custom_text.dart';
import '../widgets/language_option_tile.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});
  static const String routeName = '/language-screen';

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  bool _isChangingLanguage = false;

  Future<void> _handleLanguageChange(
    LanguageProvider provider,
    String langCode,
  ) async {
    if (_isChangingLanguage) return; // Prevent multiple simultaneous changes

    setState(() {
      _isChangingLanguage = true;
    });

    try {
      await provider.changeLanguage(langCode);
    } finally {
      if (mounted) {
        setState(() {
          _isChangingLanguage = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LanguageProvider>(context);
    final selectedLang = provider.locale.languageCode;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Navigator.pop(context, true);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Back Button & Title
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context, true),
                      child: Icon(Icons.arrow_back_ios, color: AppColors.black),
                    ),
                    SizedBox(width: 100.w),
                    CustomText(
                      text: AppStrings.selectLanguage.tr,
                      fontSize: 20,
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                /// Heading Texts
                Center(
                  child: Column(
                    children: [
                      CustomText(
                        text: AppStrings.chooseYourLanguage.tr,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 12.h),
                      CustomText(
                        text:
                            AppStrings.selectYourPreferredLanguageToContinue.tr,
                        fontSize: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),

                /// Language Options
                Column(
                  children: [
                    LanguageOptionTile(
                      image: AppIcons.usaFlag,
                      label: "English",
                      isSelected: selectedLang == 'en',
                      isEnabled: !_isChangingLanguage,
                      onTap: () => _handleLanguageChange(provider, 'en'),
                    ),
                    SizedBox(height: 16.h),
                    LanguageOptionTile(
                      image: AppIcons.bdFlag,
                      label: "বাংলা",
                      isSelected: selectedLang == 'bn',
                      isEnabled: !_isChangingLanguage,
                      onTap: () => _handleLanguageChange(provider, 'bn'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
