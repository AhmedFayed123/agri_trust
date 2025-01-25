import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constant/app_icons.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_strings.dart';
import '../../../../../core/constant/app_styles.dart';
import '../../../../../core/resources/assets_path.dart';

class CustomProductItem extends StatelessWidget {
  final String itemTitle;
  final String details;
  final String scanStatus;

  const CustomProductItem({
    super.key,
    required this.itemTitle,
    required this.details,

    required this.scanStatus,
  });

  @override
  Widget build(BuildContext context) {
    Icon scanIcon = scanStatus == "success"
        ? const Icon(
      AppIcons.checkCircle,
      color: AppColors.secondary,
      size: 34,
    )
        : const Icon(
      AppIcons.error,
      color: AppColors.bernRed,
      size: 34,
    );

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
                    scanIcon,
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              itemTitle,
                              style: AppStyles.tajawal14,
                            ),
                            Row(
                              children: [
                                Text(
                                  AppStrings.dash,
                                  style: AppStyles.tajawal14.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.gray2,
                                  ),
                                ),
                                Text(
                                  details,
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
              SizedBox(height: 10.h),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //     Text(
              //       itemDesc,
              //       style: AppStyles.tajawal14,
              //     ),
              //     Text(
              //       itemDescCode,
              //       style: AppStyles.tajawal14.copyWith(
              //         fontWeight: FontWeight.w500,
              //         color: AppColors.listItemBorder,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
