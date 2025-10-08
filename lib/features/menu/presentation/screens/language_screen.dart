// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hishabi/core/localization/string_extension.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/localization/language_provider.dart';
import '../../../../core/widgets/texts_widgets/custom_text.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});
  static const String routeName = '/language-screen';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LanguageProvider>(context);
    final current = provider.locale.languageCode;

    final languages = {
      'en': AppStrings.english.tr,
      'bn': AppStrings.bengali.tr,
    };

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, true); // Return true to indicate rebuild needed
        return false; // Prevent default pop since we already handled it
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: CustomText(text: AppStrings.selectLanguage.tr),
          backgroundColor: AppColors.white,
        ),
        body: ListView(
          children: languages.entries.map((entry) {
            return RadioListTile<String>(
              title: Text(entry.value),
              value: entry.key,
              groupValue: current,
              onChanged: (val) async {
                await provider.changeLanguage(val!);
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  (context as Element).markNeedsBuild();
                });
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
