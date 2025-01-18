import 'package:agri_trust/core/constant/app_colors.dart';
import 'package:agri_trust/core/constant/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDetailsButton extends StatelessWidget {
  const CustomDetailsButton(
      {super.key, required this.icon, required this.title, required this.onPressed});

  final IconData? icon;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: 60.w,
        height: 91.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 60.h,
              width: 60.w,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Icon(
                icon,
                color: AppColors.primary,
                size: 38,
              ),
            ),
            Text(
              title,
              style: AppStyles.tajawal14,
            )
          ],
        ),
      ),
    );
  }
}
