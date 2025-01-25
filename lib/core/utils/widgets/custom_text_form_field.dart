import 'package:agri_trust/core/constant/app_colors.dart';
import 'package:agri_trust/core/constant/app_icons.dart';
import 'package:agri_trust/core/constant/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.title,
    required this.controller,
    this.isPassword = false,
    this.obscureText = false,
    this.onToggleVisibility,
    this.width = 343,
    this.type = TextInputType.text,
    this.errorText,
  });

  final String title;
  final TextEditingController controller;
  final bool isPassword;
  final bool obscureText;
  final double width;
  final VoidCallback? onToggleVisibility;
  final TextInputType type;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.bodyText12,
          ),
          SizedBox(
            height: 46.h,
            width: width.w,
            child: TextField(
              keyboardType: type,
              controller: controller,
              obscureText: isPassword ? obscureText : false,
              style: AppStyles.bodyText14.copyWith(color: AppColors.textPrimary),
              decoration: InputDecoration(
                hintText: 'ادخل $title',
                hintStyle: AppStyles.bodyText12,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 14.h,
                  horizontal: 12.w,
                ),
                suffixIcon: isPassword
                    ? IconButton(
                  icon: Icon(
                    size: 18,
                    color: AppColors.icon,
                    obscureText
                        ? AppIcons.visibilityOffOutlined
                        : AppIcons.visibilityOutlined,
                  ),
                  onPressed: onToggleVisibility,
                )
                    : null,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.r),
                  ),
                  borderSide: const BorderSide(
                    color: AppColors.border,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.r),
                  ),
                  borderSide: const BorderSide(
                    color: AppColors.border,
                    width: 1,
                  ),
                ),
                errorText: errorText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
