import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hishabi/features/home/presentation/widgets/transaction_item.dart';
import 'package:hishabi/core/localization/string_extension.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/image_widgets/custom_image.dart';
import '../../../../core/widgets/texts_widgets/custom_text.dart';
import '../../../user/presentation/providers/user_provider.dart';
import '../providers/balance_provider.dart';
import '../providers/transaction_provider.dart';
import '../widgets/balance_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _refreshAll(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return AppStrings.goodMorning.tr;
    } else if (hour >= 12 && hour < 14) {
      return AppStrings.goodNoon.tr;
    } else if (hour >= 14 && hour < 17) {
      return AppStrings.goodAfternoon.tr;
    } else if (hour >= 17 && hour < 20) {
      return AppStrings.goodEvening.tr;
    } else if (hour >= 20 && hour < 24) {
      return AppStrings.goodNight.tr;
    } else {
      return AppStrings.goodEarlyMorning.tr;
    }
  }

  @override
  Widget build(BuildContext context) {
    final balanceProvider = Provider.of<BalanceProvider>(context);
    final provider = Provider.of<TransactionProvider>(context);
    final userProvider = context.watch<UserProvider>();
    final user = userProvider.activeUser;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: () => _refreshAll(context),
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CustomImage(
                    imageSrc: AppImages.homeTopBg,
                    sizeWidth: double.infinity,
                    sizeHeight: 310.h,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 80.h,
                    left: 16.w,
                    right: 16.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: _getGreeting(),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                            SizedBox(height: 4.h),
                            CustomText(
                              text: user!.name,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                          ],
                        ),
                        Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white.withOpacity(0.2),
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.notifications,
                              color: AppColors.white,
                              size: 22.r,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -80.h,
                    left: 16.w,
                    right: 16.w,
                    child: BalanceCard(
                      balanceAmount: balanceProvider.balance.toStringAsFixed(2),
                      incomeAmount: balanceProvider.income.toStringAsFixed(2),
                      expenseAmount: balanceProvider.expense.toStringAsFixed(2),
                    ),
                  ),
                ],
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 100.h)),

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: AppStrings.transactionsHistory.tr,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: CustomText(
                        text: AppStrings.seeAll.tr,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return TransactionItem(tx: provider.transactions[index]);
              }, childCount: provider.transactions.length),
            ),
          ],
        ),
      ),
    );
  }
}
