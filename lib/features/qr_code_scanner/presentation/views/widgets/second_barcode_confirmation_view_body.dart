import 'package:agri_trust/features/qr_code_scanner/presentation/views/widgets/qr_scanner_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_strings.dart';
import '../../../../../core/resources/assets_path.dart';
import '../../../../../core/router/routes.dart';
import '../../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import 'custom_scanner_text_column.dart';

class SecondBarcodeConfirmationViewBody extends StatelessWidget {
  const SecondBarcodeConfirmationViewBody({super.key});

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
                    AssetsPath.productImage,
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
                title: AppStrings.insertBarCode,
                desc: AppStrings.insertBarCodeDesc,
              ),
              SizedBox(height: 40.h),
              CustomButton(
                title: AppStrings.checkNow,
                onPressed: () {
                  context.go(AppRoutes.productDetails);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
