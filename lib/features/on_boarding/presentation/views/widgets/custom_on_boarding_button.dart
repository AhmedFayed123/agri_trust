import 'package:agri_trust/core/constant/app_colors.dart';
import 'package:agri_trust/core/constant/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOnBoardingButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomOnBoardingButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: 48,
              width: 170,
              decoration: BoxDecoration(
                color: AppColors.buttonShadow,
                borderRadius: BorderRadius.circular(25.r),
              ),
            ),
            Container(
              height: 48,
              width: 145,
              decoration: BoxDecoration(
                color: AppColors.button,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Center(
                child: Text(
                  text,
                  style: AppStyles.buttonText16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
