import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/texts_widgets/custom_text.dart';

class BalanceCard extends StatefulWidget {
  final String balanceAmount;
  final String incomeAmount;
  final String expenseAmount;

  const BalanceCard({
    super.key,
    required this.balanceAmount,
    required this.incomeAmount,
    required this.expenseAmount,
  });

  @override
  State<BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  bool _showBalance = true;
  void _toggleBalance() {
    setState(() {
      _showBalance = !_showBalance;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      height: 200.h,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.primary, // replace with your theme color
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomText(
                    text: AppStrings.totalBalance,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                  GestureDetector(
                    onTap: _toggleBalance,
                    child: Icon(
                      _showBalance
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: AppColors.white,
                      size: 20.r,
                    ),
                  ),
                ],
              ),
              Icon(Icons.more_horiz, color: AppColors.white, size: 20.r),
            ],
          ),
          SizedBox(height: 8.h),

          CustomText(
            text: _showBalance ? widget.balanceAmount : '••••••',
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: AppStrings.income,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                  CustomText(
                    text: widget.incomeAmount,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: AppStrings.expenses,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                  CustomText(
                    text: widget.expenseAmount,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
