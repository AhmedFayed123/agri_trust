import 'package:agri_trust/core/router/routes.dart';
import 'package:agri_trust/features/wallet/presentation/views/widgets/wallet_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_strings.dart';
import '../../../../../core/constant/app_styles.dart';
import '../../../../../core/utils/widgets/custom_app_bar.dart';

class WalletViewBody extends StatelessWidget {
  const WalletViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          title: AppStrings.wallet,
          onPressed: () => context.go(AppRoutes.home),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 22.0.w,
            right: 22.0.w,
            top: 12.0.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: Text(
                  AppStrings.replaceNow,
                  style: AppStyles.tajawal14.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.oxfordBlue,
                  ),
                ),
                onTap: () => context.go(
                  AppRoutes.wallet,
                ),
              ),
              Text(
                AppStrings.totalBalance,
                style: AppStyles.tajawal14.copyWith(
                  color: AppColors.oxfordBlue,
                ),
              ),
            ],
          ),
        ),
        const Expanded(child: WalletTabBar())
      ],
    );
  }
}
