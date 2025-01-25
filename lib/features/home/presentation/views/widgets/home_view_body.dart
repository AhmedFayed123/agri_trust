import 'package:agri_trust/core/constant/app_strings.dart';
import 'package:agri_trust/core/constant/app_styles.dart';
import 'package:agri_trust/core/resources/assets_path.dart';
import 'package:agri_trust/features/home/presentation/views/widgets/wallet_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'advertisings_list.dart';
import 'home_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                HomeAppBar(
                  onPressed: () {
                    scaffoldKey.currentState!.openEndDrawer();
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0.h),
              child: const AdvertisingsList(),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 12.0.w,
                right: 12.w,
                top: 8.h,
                bottom: 8.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // GestureDetector(
                  //   child: Text(
                  //     AppStrings.viewAll,
                  //     style: AppStyles.tajawal14.copyWith(
                  //       fontWeight: FontWeight.w500,
                  //       color: AppColors.gray2,
                  //     ),
                  //   ),
                  //   onTap: () => context.go(
                  //     AppRoutes.wallet,
                  //   ),
                  // ),
                  Text(
                    AppStrings.products,
                    style: AppStyles.tajawal14,
                  ),
                ],
              ),
            ),
            const WalletList(),
            // Padding(
            //   padding: EdgeInsets.only(
            //     left: 12.0.w,
            //     right: 12.0.w,
            //     bottom: 8.h,
            //   ),
            //   child: Align(
            //     alignment: Alignment.centerRight,
            //     child: Text(
            //       AppStrings.gifts,
            //       style: AppStyles.tajawal14,
            //     ),
            //   ),
            // ),
            // const PointsSlider(),
          ],
        ),
      ),
    );
  }
}
