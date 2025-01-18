import 'package:agri_trust/core/router/routes.dart';
import 'package:agri_trust/core/utils/widgets/custom_button.dart';
import 'package:agri_trust/features/auth/presentation/views/widgets/auth_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/app_strings.dart';
import '../../../../core/utils/widgets/custom_text_form_field.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

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
                    title: AppStrings.forgetPassword,
                    subTitle: AppStrings.forgetPasswordSubTitle,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  CustomTextFormField(
                    title: AppStrings.phoneNumber,
                    controller: TextEditingController(),
                    type: TextInputType.phone,
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  CustomButton(
                      title: AppStrings.sendCode,
                      onPressed: () {
                        context.go(
                          AppRoutes.codeVerificationView,
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
