import 'package:agri_trust/core/constant/app_strings.dart';
import 'package:agri_trust/core/constant/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/app_colors.dart';

class ReplacingListItemButton extends StatelessWidget {
  const ReplacingListItemButton({
    super.key,
    required this.onPressed,
    this.btnColor = AppColors.primary,
    this.textColor = AppColors.oxfordBlue,
    this.title = AppStrings.replacing,
  });

  final VoidCallback onPressed;
  final Color btnColor;
  final Color textColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 132.w,
        height: 36.h,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.charcoal.withOpacity(.25),
              spreadRadius: 0,
              blurRadius: 6.1,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: AppStyles.tajawal14.copyWith(
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
