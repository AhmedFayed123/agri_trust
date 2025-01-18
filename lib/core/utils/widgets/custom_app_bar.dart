import 'package:agri_trust/core/constant/app_colors.dart';
import 'package:agri_trust/core/constant/app_icons.dart';
import 'package:agri_trust/core/constant/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.onPressed});

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.0.h),
        child: SizedBox(
          width: 341.w,
          height: 24.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Text(
                  title,
                  style: AppStyles.tajawal16.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: onPressed,
                  icon: const Icon(
                    AppIcons.arrowForward,
                    color: AppColors.black2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
