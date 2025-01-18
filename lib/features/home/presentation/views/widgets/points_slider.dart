import 'package:agri_trust/core/constant/app_strings.dart';
import 'package:agri_trust/core/constant/app_styles.dart';
import 'package:agri_trust/core/resources/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/app_colors.dart';

class PointsSlider extends StatelessWidget {
  const PointsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 138.h,
      width: 343.w,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.all(Radius.circular(20.r)),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
          ),
        ],
      ),
      child: Center(
        child: SizedBox(
          height: 111.h,
          width: 293.w,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  height: 45.h,
                  width: 217.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      width: 1.w,
                      color: AppColors.lightGray,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 32.0.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          AppStrings.points350,
                          style: AppStyles.tajawal16.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Image.asset(
                          AssetsPath.gift,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 13.0.h,
                  ),
                  child: Slider(
                    activeColor: AppColors.secondary,
                    value: 350,
                    max: 500,
                    onChanged: (double value) {},
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  AppStrings.checkGifts,
                  style: AppStyles.tajawal14.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.oxfordBlue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
