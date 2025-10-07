import 'package:flutter/material.dart';
import 'package:hishabi/core/localization/string_extension.dart';
import 'package:provider/provider.dart';

import 'language_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('menu_title'.tr)),
      body: ListView(
        children: [
          ListTile(
            title: Text('change_language'.tr),
            trailing: const Icon(Icons.language),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LanguageScreen()),
              );
            },
          ),
          ListTile(title: Text('hello'.tr), onTap: () {}),
        ],
      ),
    );
  }
}
