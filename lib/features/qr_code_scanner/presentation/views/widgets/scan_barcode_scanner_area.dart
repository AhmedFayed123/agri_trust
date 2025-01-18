import 'package:agri_trust/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../manger/product_cubit/product_cubit.dart';

class ScanBarCodeScannerArea extends StatelessWidget {
  const ScanBarCodeScannerArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      width: 220.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35.r),
        child: MobileScanner(
          onDetect: (BarcodeCapture barcodeCapture) {
            final List<Barcode> barcodes = barcodeCapture.barcodes;
            if (barcodes.isNotEmpty) {
              final String? scannedCode = barcodes.first.rawValue;
              if (scannedCode != null) {
                context.read<ProductCubit>().scanBarcode(scannedCode);
                context.go(AppRoutes.barcodeConfirmationView,extra: scannedCode);
              }
            }
          },
        ),
      ),
    );
  }
}
