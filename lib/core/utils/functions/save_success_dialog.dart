import 'package:agri_trust/core/constant/app_colors.dart';
import 'package:agri_trust/core/constant/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constant/app_strings.dart';
import '../../constant/app_styles.dart';

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0.r),
        ),
        contentPadding: EdgeInsets.all(30.0.w),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              AppIcons.checkCircle,
              color: AppColors.secondary,
              size: 34,
            ),
            SizedBox(height: 8.h),
            Text(
              AppStrings.savedSuccessfully,
              style: AppStyles.tajawal14.copyWith(
                color: AppColors.oxfordBlue,
              ),
            ),
            Text(
              AppStrings.viewInGallery,
              style: AppStyles.tajawal14.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.gray2,
              ),
            ),
          ],
        ),
      );
    },
  );
}

