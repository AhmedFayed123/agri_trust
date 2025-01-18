import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constant/app_strings.dart';
import '../../../../../core/router/routes.dart';
import '../../../../../core/utils/widgets/custom_app_bar.dart';
import '../../../../../core/utils/widgets/custom_product_item.dart';
import 'custom_details_button.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

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
          const CustomProductItem(),
          SizedBox(height: 40.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomDetailsButton(
                icon: Icons.share,
                title: AppStrings.share,
                onPressed: () {},
              ),
              SizedBox(width: 32.w),
              CustomDetailsButton(
                icon: Icons.save,
                title: AppStrings.save,
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
