import 'package:agri_trust/features/qr_code_scanner/presentation/views/widgets/qr_scanner_overlay.dart';
import 'package:agri_trust/features/qr_code_scanner/presentation/views/widgets/scan_barcode_scanner_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_strings.dart';
import '../../../../../core/constant/app_styles.dart';
import '../../../../../core/resources/assets_path.dart';
import '../../../../../core/router/routes.dart';
import '../../../../../core/utils/widgets/custom_app_bar.dart';
import 'custom_scanner_text_column.dart';

class ScanBarcodeViewBody extends StatelessWidget {
  const ScanBarcodeViewBody({super.key});

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
                  const ScanBarCodeScannerArea(),
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
                title: AppStrings.insertBarCode,
                desc: AppStrings.insertBarCodeDesc,
              ),
              SizedBox(height: 50.h),
              // const CameraOrGalleryRow(),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.secondary,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.secondary.withOpacity(0.4),
                          spreadRadius: 4,
                          blurRadius: 12,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Image.asset(
                        AssetsPath.scanCode,
                        width: 30.w,
                        height: 30.h,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    AppStrings.camera,
                    style: AppStyles.bodyText14.copyWith(
                      color: AppColors.black2,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
