import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../onboarding/presentation/screens/onboarding_screen.dart';
import '../provider/splash_provider.dart';
import '../widgets/typewriter_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();
    Future.microtask(() {
      Provider.of<SplashProvider>(context, listen: false).initializeSplash(
        onComplete: () {
          if (mounted) {
            Navigator.pushReplacementNamed(context, OnboardingScreen.routeName);
          }
        },
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Container(
            //   height: 160,
            //   width: 160,

            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     color: AppColors.white,
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
            //     child: CustomImage(imageSrc: AppImages.logo, size: 120),
            //   ),
            // ),
            SizedBox(height: 12.h), // set to zero for tight layout
            TypewriterText(text: AppStrings.appName, animation: _animation),
          ],
        ),
      ),
    );
  }
}
