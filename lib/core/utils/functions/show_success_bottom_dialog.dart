import 'package:agri_trust/core/router/routes.dart';
import 'package:agri_trust/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../constant/app_colors.dart';
import '../../constant/app_icons.dart';
import '../../constant/app_strings.dart';
import '../../constant/app_styles.dart';

void showSuccessBottomDialog(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0.r),
        topRight: Radius.circular(20.0.r),
      ),
    ),
    backgroundColor: Colors.white,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(30.0.w),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              AppIcons.checkCircleOutlineRounded,
              color: AppColors.secondary,
              size: 80,
            ),
            SizedBox(height: 26.h),
            Text(
              AppStrings.passwordUpdatedSuccessfully,
              textAlign: TextAlign.center,
              style: AppStyles.buttonText16.copyWith(
                color: AppColors.carbon,
              ),
            ),
            SizedBox(height: 26.h),

            CustomButton(
              title: AppStrings.login,
              onPressed: () => context.go(AppRoutes.auth),
            ),
          ],
        ),
      );
    },
  );
}
