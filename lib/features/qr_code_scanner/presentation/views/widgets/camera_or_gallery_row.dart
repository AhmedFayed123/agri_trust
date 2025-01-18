import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_strings.dart';
import '../../../../../core/constant/app_styles.dart';
import '../../../../../core/resources/assets_path.dart';
import '../../../../../core/router/routes.dart';

class CameraOrGalleryRow extends StatelessWidget {
  const CameraOrGalleryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200.h,
      child: Stack(
        children: [
          Positioned(
            bottom: 50.h,
            left: 16.w,
            child: GestureDetector(
              onTap: () {
                context.go(AppRoutes.loadingScreen);
              },
              child: Image.asset(
                AssetsPath.gallery,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 60.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.secondary,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.secondary.withOpacity(0.4),
                        spreadRadius: 4,
                        blurRadius: 12,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Image.asset(
                      AssetsPath.scanCode,
                      width: 30.w,
                      height: 30.h,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  AppStrings.camera,
                  style: AppStyles.bodyText14.copyWith(
                    color: AppColors.black2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
