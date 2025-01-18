import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/app_strings.dart';
import '../../../../../core/constant/app_styles.dart';

class OnBoardingAppBar extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Function() onSkipPressed;
  final Function() onBackPressed;
  final bool showBackButton;

  const OnBoardingAppBar({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onSkipPressed,
    required this.onBackPressed,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showBackButton && currentPage > 0)
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 22.sp,
              ),
              onPressed: onBackPressed,
            ),
          if (currentPage < totalPages - 1)
            TextButton(
              onPressed: onSkipPressed,
              child: Text(
                AppStrings.skip,
                style: AppStyles.buttonText14,
              ),
            ),
        ],
      ),
    );
  }
}
