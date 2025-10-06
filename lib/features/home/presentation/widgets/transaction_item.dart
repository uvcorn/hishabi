import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hishabi/core/widgets/texts_widgets/custom_text.dart';
import 'package:hishabi/features/home/domain/entities/transaction.dart';

import '../../../../core/constants/app_colors.dart';

class TransactionItem extends StatelessWidget {
  final Transaction tx;
  const TransactionItem({super.key, required this.tx});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.borderGray,
            ),
            child: Icon(
              tx.isIncome ? Icons.trending_up : Icons.trending_down,
              color: tx.isIncome ? AppColors.green : AppColors.red,
            ),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: tx.title,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              CustomText(text: tx.date, fontSize: 12.sp),
            ],
          ),
          Spacer(),
          CustomText(
            text:
                "${tx.isIncome ? "+ " : "- "}\$${tx.amount.toStringAsFixed(2)}",
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
