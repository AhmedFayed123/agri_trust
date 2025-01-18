import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/app_strings.dart';
import '../../../../../core/constant/app_styles.dart';

class HistoryAppBar extends StatelessWidget {
  const HistoryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0.h),
        child: SizedBox(
          width: 341.w,
          height: 24.h,
          child: Center(
            child: Text(
              AppStrings.history,
              style: AppStyles.tajawal16.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
