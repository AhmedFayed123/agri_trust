import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_styles.dart';

class CustomSettingsItem extends StatelessWidget {
  const CustomSettingsItem(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.icon});

  final String title;
  final String subTitle;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.0.h),
      child: Center(
        child: Container(
          width: 343.w,
          height: 68.h,
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 10.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Switch(
                      activeColor: AppColors.biceGreen,
                      value: true,
                      onChanged: (bool value) {},
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              title,
                              style: AppStyles.tajawal14,
                            ),
                            Text(
                              subTitle,
                              style: AppStyles.tajawal14.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.gray2,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(
                          icon,
                          size: 24,
                          color: AppColors.biceGreen,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
