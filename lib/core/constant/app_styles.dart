import 'package:agri_trust/core/constant/app_colors.dart';
import 'package:agri_trust/core/constant/app_strings.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static TextStyle headline20 = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.headline,
    fontFamily: AppStrings.poppins,
  );
  static TextStyle headline24 = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
    fontFamily: AppStrings.poppins,
  );

  static TextStyle bodyText14 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.bodyTextColor,
    fontFamily: AppStrings.poppins,
  );
  static TextStyle bodyText12 = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.gray,
    fontFamily: AppStrings.poppins,
  );

  static TextStyle buttonText16 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textButton,
    fontFamily: AppStrings.poppins,
  );

  static TextStyle buttonText14 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.skipButton,
    decoration: TextDecoration.underline,
    fontFamily: AppStrings.poppins,
  );
  static TextStyle buttonText = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
    fontFamily: AppStrings.poppins,
  );
  static TextStyle tajawal14 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.black2,
    fontFamily: AppStrings.tajawal,
  );
  static TextStyle tajawal12 = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.grayAsp,
    fontFamily: AppStrings.tajawal,
  );
  static TextStyle tajawal16 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.black2,
    fontFamily: AppStrings.tajawal,
  );
  static TextStyle tajawal20 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.black2,
    fontFamily: AppStrings.tajawal,
  );
}
