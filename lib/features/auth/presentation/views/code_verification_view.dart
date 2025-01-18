import 'package:agri_trust/core/constant/app_colors.dart';
import 'package:agri_trust/core/constant/app_styles.dart';
import 'package:agri_trust/features/auth/presentation/views/widgets/auth_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/constant/app_strings.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/utils/widgets/custom_button.dart';

class CodeVerificationView extends StatelessWidget {
  const CodeVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AuthAppBar(
                    title: AppStrings.digitalCode,
                    subTitle: AppStrings.digitalCodeSubTitle,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  SizedBox(
                    width: 264.w,
                    child: PinCodeTextField(
                      appContext: context,
                      length: 4,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(8.r),
                        fieldHeight: 48.h,
                        fieldWidth: 48.w,
                        activeColor: AppColors.metallicSilver,
                        selectedColor: AppColors.metallicSilver,
                        inactiveColor: AppColors.metallicSilver,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          AppStrings.resendCode,
                          style: AppStyles.buttonText16.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.carbon,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      Text(
                        AppStrings.phoneNotReceived,
                        style: AppStyles.buttonText16.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.dimGray,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  CustomButton(
                      title: AppStrings.next,
                      onPressed: () {
                        context.go(
                          AppRoutes.createNewPassword,
                        );
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
