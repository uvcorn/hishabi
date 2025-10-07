import '../../main.dart'; // Import to access navigatorKey
import 'app_localizations.dart';

extension StringTranslation on String {
  String get tr {
    final context = navigatorKey.currentContext;
    if (context == null) {
      return this; // Return key if context not available
    }
    return AppLocalizations.of(context).tr(this);
  }
}
