import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hisabi/core/constants/app_colors.dart';
import 'package:hisabi/features/home/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';

import '../../../features/statistics/presentation/screens/statistics_screen.dart';
import 'nav_provider.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({super.key});
  static const String routeName = '/nav-screen';
  final List<Widget> _pages = const [
    HomeScreen(),
    StatisticsScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<NavProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: _pages[navProvider.currentIndex],
      floatingActionButton: SizedBox(
        height: 75,
        width: 75,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: AppColors.primary,
          onPressed: () {
            print('FAB Pressed');
          },
          child: Icon(
            Icons.add,
            size: 40,
            color: AppColors.white,
          ), // icon বড় করো
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        height: 80, // যেকোনো height দিতে পারো
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => navProvider.setIndex(0),
              child: Icon(
                Icons.home,
                color: navProvider.currentIndex == 0
                    ? AppColors.primary
                    : Colors.grey,
                size: 35.r,
              ),
            ),
            GestureDetector(
              onTap: () => navProvider.setIndex(1),
              child: Icon(
                Icons.bar_chart,
                color: navProvider.currentIndex == 1
                    ? AppColors.primary
                    : Colors.grey,
                size: 35.r,
              ),
            ),
            SizedBox(width: 35.r),
            GestureDetector(
              onTap: () => navProvider.setIndex(2),
              child: Icon(
                Icons.account_balance_wallet,
                color: navProvider.currentIndex == 2
                    ? AppColors.primary
                    : Colors.grey,
                size: 35.r,
              ),
            ),
            GestureDetector(
              onTap: () => navProvider.setIndex(3),
              child: Icon(
                Icons.person,
                color: navProvider.currentIndex == 3
                    ? AppColors.primary
                    : Colors.grey,
                size: 35.r,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
