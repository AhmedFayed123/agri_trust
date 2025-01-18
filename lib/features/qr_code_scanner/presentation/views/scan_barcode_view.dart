import 'package:agri_trust/features/qr_code_scanner/presentation/views/widgets/scan_barcode_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manger/product_cubit/product_cubit.dart';

class ScanBarcodeView extends StatelessWidget {
  const ScanBarcodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductCubit(),
      child: const SafeArea(
        child: Scaffold(
          body:ScanBarcodeViewBody(),
        ),
      ),
    );
  }
}
