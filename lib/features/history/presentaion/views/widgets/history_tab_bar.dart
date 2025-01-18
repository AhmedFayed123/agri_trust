import 'package:agri_trust/features/history/presentaion/views/widgets/fake_list.dart';
import 'package:agri_trust/features/history/presentaion/views/widgets/matching_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_strings.dart';
import '../../../../../core/constant/app_styles.dart';

class HistoryTabBar extends StatelessWidget {
  const HistoryTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0.h),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(12.h),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                padding:
                    EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 4.0.h),
                height: 60.h,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(5.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black2.withOpacity(.25),
                      spreadRadius: 0,
                      blurRadius: 11,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.darkCharcoal, AppColors.secondary],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                    border: Border.all(
                      color: AppColors.primary,
                      width: 2.w,
                    ),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: AppStyles.tajawal14,
                  labelColor: AppColors.primary,
                  unselectedLabelColor: AppColors.nonActiveTap,
                  indicatorColor: AppColors.primary,
                  dividerHeight: 0,
                  tabs: const [
                    Tab(text: AppStrings.matching),
                    Tab(text: AppStrings.fake),
                  ],
                ),
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              MatchingList(),
              FakeList(),
            ],
          ),
        ),
      ),
    );
  }
}
