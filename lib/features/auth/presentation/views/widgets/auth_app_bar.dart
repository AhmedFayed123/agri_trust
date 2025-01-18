import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/app_styles.dart';
import '../../../../../core/resources/assets_path.dart';

class AuthAppBar extends StatelessWidget {
  const AuthAppBar({super.key, required this.title, this.subTitle=''});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetsPath.splashLogo,
            fit: BoxFit.cover,
            height: 74.h,
            width: 71.w,
          ),
          Text(
            title,
            style: AppStyles.headline24,
          ),
          SizedBox(height: 8.h,),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: AppStyles.bodyText12,
          ),
        ],
      ),
    );
  }
}
