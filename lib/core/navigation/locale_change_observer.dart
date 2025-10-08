import 'package:flutter/material.dart';

import '../../main.dart';

class LocaleChangeObserver extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      (navigatorKey.currentContext as Element?)?.markNeedsBuild();
    });
    super.didPop(route, previousRoute);
  }
}
