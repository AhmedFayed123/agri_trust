import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_styles.dart';

class CustomScannerTextColumn extends StatelessWidget {
  const CustomScannerTextColumn({super.key, required this.title, required this.desc});

  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppStyles.tajawal20,
        ),
        SizedBox(height: 10.h),
        Text(
          desc,
          style: AppStyles.tajawal14.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.gray2,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
