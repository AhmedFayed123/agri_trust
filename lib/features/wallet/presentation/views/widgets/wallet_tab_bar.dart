import 'package:agri_trust/core/constant/app_icons.dart';
import 'package:agri_trust/features/wallet/presentation/views/widgets/redeemed_points_list.dart';
import 'package:agri_trust/features/wallet/presentation/views/widgets/replacing_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_strings.dart';
import '../../../../../core/constant/app_styles.dart';
import 'current_points_list.dart';

class WalletTabBar extends StatelessWidget {
  const WalletTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: ButtonsTabBar(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            radius: 5.r,
            unselectedBackgroundColor: AppColors.primary,
            unselectedLabelStyle:
                AppStyles.tajawal14.copyWith(color: AppColors.nonActiveTap),
            backgroundColor: AppColors.secondary,
            labelStyle: AppStyles.tajawal14.copyWith(color: AppColors.primary),
            borderWidth: 0,
            buttonMargin: EdgeInsets.symmetric(horizontal: 12.w),
            tabs: [
              Tab(
                text: AppStrings.replacing,
                icon: Icon(AppIcons.arrowBack,
                    color: AppColors.primary, size: 12.sp),
              ),
              const Tab(
                text: AppStrings.redeemedPoints,
              ),
              const Tab(
                text: AppStrings.currentPoints,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.w),
              child: const ReplacingList(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.w),
              child: const RedeemedPointsList(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.w),
              child: const CurrentPointsList(),
            ),
          ],
        ),
      ),
    );
  }
}
