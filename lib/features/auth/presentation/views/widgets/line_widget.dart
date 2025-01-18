import 'package:agri_trust/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LineWidget extends StatelessWidget {
  const LineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 118.5.w,
      height: 1.h,
      color: AppColors.line,
    );
  }
}
