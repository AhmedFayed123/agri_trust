import 'package:agri_trust/core/constant/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/app_colors.dart';
import '../../constant/app_strings.dart';
import '../../constant/app_styles.dart';
import '../../resources/assets_path.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.0.h),
      child: Center(
        child: Container(
          width: 343.w,
          height: 159.h,
          decoration: BoxDecoration(
            color: AppColors.primary,
            boxShadow: [
              BoxShadow(
                color: AppColors.black2.withOpacity(.25),
                spreadRadius: 0,
                blurRadius: 11,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: 343.w,
                height: 76.h,
                padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                decoration: BoxDecoration(
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
                      size: 34,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.itemTitle,
                              style: AppStyles.tajawal14,
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
              SizedBox(height: 10.h,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    AppStrings.itemDesc,
                    style: AppStyles.tajawal14,
                  ),
                  Text(
                    AppStrings.itemDescCode,
                    style: AppStyles.tajawal14.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.listItemBorder,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
