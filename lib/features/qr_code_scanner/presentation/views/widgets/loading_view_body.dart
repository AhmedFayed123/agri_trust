import 'package:agri_trust/core/constant/app_styles.dart';
import 'package:agri_trust/features/qr_code_scanner/presentation/views/widgets/qr_scanner_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_strings.dart';
import '../../../../../core/resources/assets_path.dart';
import '../../../../../core/router/routes.dart';
import '../../../../../core/utils/widgets/custom_app_bar.dart';
import 'custom_scanner_text_column.dart';

class LoadingViewBody extends StatelessWidget {
  const LoadingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(
            title: AppStrings.productScan,
            onPressed: () => context.go(AppRoutes.home),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            height: 400.h,
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    AssetsPath.qrCode,
                  ),
                  QrScannerOverlay(
                    scanAreaWidth: 310.w,
                    scanAreaHeight: 291.h,
                    cornerLength: 20,
                    cornerThickness: 2,
                    cornerColor: AppColors.qrOverLayBorder,
                    cornerRadius: 58,
                  ),
                  Image.asset(
                    AssetsPath.greenLine,
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomScannerTextColumn(
                title: AppStrings.loadingImage,
                desc: AppStrings.loadingImageDesc,
              ),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: EdgeInsets.all(16.0.sp),
                child: LinearPercentIndicator(
                  alignment: MainAxisAlignment.center,
                  animation: true,
                  width: 215.w,
                  lineHeight: 10.0.h,
                  animationDuration: 2500,
                  percent: 0.8,
                  progressColor: AppColors.loadingGreen,
                  backgroundColor: AppColors.loadingLightGreen,
                  barRadius: Radius.circular(7.r),
                ),
              ),
              Text(
                AppStrings.loading,
                style: AppStyles.tajawal14.copyWith(
                    color: AppColors.spanishGrey, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5.h,
              ),
              GestureDetector(
                onTap: (){context.go(AppRoutes.barcodeConfirmationView);},
                child: Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: const BoxDecoration(
                      color: AppColors.darkCharcoal, shape: BoxShape.circle),
                  child: const Center(
                    child: Icon(
                      Icons.close,
                      size: 32,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
