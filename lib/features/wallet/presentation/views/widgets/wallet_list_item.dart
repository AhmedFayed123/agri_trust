import 'package:agri_trust/core/constant/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_strings.dart';
import '../../../../../core/constant/app_styles.dart';
import '../../../../../core/resources/assets_path.dart';

class WalletListItem extends StatelessWidget {
  const WalletListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 8.h),
      child: Center(
        child: Container(
          width: 375.w,
          height: 59.h,
          decoration: BoxDecoration(
            color: AppColors.primary,
            border: Border(
              bottom: BorderSide(
                width: 0.4.w,
                style: BorderStyle.solid,
                color: AppColors.listItemBorder,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                AppIcons.checkCircle,
                color: AppColors.secondary,
                size: 24,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.itemTitle,
                        style: AppStyles.tajawal14.copyWith(color: AppColors.oxfordBlue,),
                      ),
                      Row(
                        children: [
                          Text(
                            AppStrings.date,
                            style: AppStyles.tajawal14.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.gray2,
                            ),
                          ),
                          Text(
                            AppStrings.dash,
                            style: AppStyles.tajawal14.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.gray2,
                            ),
                          ),
                          Text(
                            AppStrings.giftPoints,
                            style: AppStyles.tajawal14.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.gray2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Image.asset(
                    height: 51.h,
                    width: 51.w,
                    AssetsPath.bag,
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
