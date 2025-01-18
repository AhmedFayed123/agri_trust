import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/app_styles.dart';
import '../../../../../core/resources/assets_path.dart';

class OnBoardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final bool isSecondScreen;

  const OnBoardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    this.isSecondScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 16.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  AssetsPath.onBoardingEllipse,
                  height: 280.h,
                  width: 280.w,
                ),
                Transform.translate(
                  offset: isSecondScreen ? Offset(0.w, 12.h) : Offset.zero,
                  child: Image.asset(
                    imagePath,
                    height: isSecondScreen ? 243.38.h : 247.27.h,
                    width: isSecondScreen ? 267.w : 252.w,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              title,
              style: AppStyles.headline20,
            ),
            SizedBox(height: 10.h),
            Text(
              description,
              textAlign: TextAlign.center,
              style: AppStyles.bodyText14,
            ),
          ],
        ),
      ),
    );
  }
}
