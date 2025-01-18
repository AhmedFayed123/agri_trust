import 'package:agri_trust/features/wallet/presentation/views/widgets/replacing_list_item_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_strings.dart';
import '../../../../../core/constant/app_styles.dart';
import '../../../../../core/resources/assets_path.dart';
import '../../../../../core/utils/functions/wallet_success_dialog.dart';

class ReplacingListItem extends StatelessWidget {
  const ReplacingListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 164.w,
        height: 173.h,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.suvaGrey.withOpacity(.25),
              spreadRadius: 0,
              blurRadius: 4.8,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              height: 51.h,
              width: 51.w,
              AssetsPath.bag,
              fit: BoxFit.fitHeight,
              alignment: Alignment.center,
            ),
            SizedBox(height: 8.h,),
            Text(
              AppStrings.itemTitle,
              style: AppStyles.tajawal14.copyWith(
                color: AppColors.oxfordBlue,
              ),
            ),
            Text(
              AppStrings.valuePoints50,
              style: AppStyles.tajawal14.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.gray2,
              ),
            ),
            SizedBox(height: 8.h,),
            ReplacingListItemButton(onPressed: ()=>showSuccessDialog(context),),
          ],
        ),
      ),
    );
  }
}
