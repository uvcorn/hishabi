import 'package:flutter/material.dart';
import '../core/widgets/bottom_nav_bar/nav_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/menu/presentation/screens/language_screen.dart';
import '../features/menu/presentation/screens/menu_screen.dart';
import '../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../features/splash/presentation/screens/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String navScreen = '/nav-screen';

  static const String menu = '/menu-screen';
  static const String language = '/language-screen';

  static Map<String, WidgetBuilder> routes = {
    splash: (_) => const SplashScreen(),
    onboarding: (_) => const OnboardingScreen(),
    home: (_) => const HomeScreen(),
    navScreen: (_) => const NavScreen(),
    menu: (_) => const MenuScreen(),
    language: (_) => const LanguageScreen(),
  };
}
