import 'package:agri_trust/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialItem extends StatelessWidget {
  const SocialItem(
      {super.key,
      required this.onPressed, required this.imagePath,
      });

  final Function() onPressed;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104.33.w,
      height: 48.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: AppColors.border)),
      child: InkWell(
        onTap: () => onPressed,
        child: Image.asset(imagePath,),
      ),
    );
  }
}
