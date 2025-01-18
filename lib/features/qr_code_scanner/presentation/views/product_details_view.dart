import 'package:agri_trust/features/qr_code_scanner/presentation/views/widgets/product_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manger/product_cubit/product_cubit.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.scannedCode});

  final String scannedCode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductCubit(),
      child: const SafeArea(
        child: Scaffold(
          body:ProductDetailsViewBody(),
        ),
      ),
    );
  }
}