import 'package:agri_trust/core/constant/app_colors.dart';
import 'package:agri_trust/core/constant/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.buttonColor = AppColors.customGreen,
    this.textColor = Colors.white,
    this.borderRadius = 10.0,
    this.padding = const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
    this.icon,
  });

  final String title;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color buttonColor;
  final Color textColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: Container(
        width: 343.w,
        height: 48.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius.r),
          color: buttonColor,
        ),
        child: Center(
          child: isLoading
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20.0.w,
                      height: 20.0.h,
                      child: const CircularProgressIndicator(
                        color: AppColors.primary,
                        strokeWidth: 2.0,
                      ),
                    ),
                    SizedBox(width: 10.w),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: AppStyles.buttonText.copyWith(color: textColor),
                    ),
                    if (icon != null) ...[
                      SizedBox(width: 10.w),
                      Icon(icon, color: textColor, size: 18.0),
                    ],
                  ],
                ),
        ),
      ),
    );
  }
}
