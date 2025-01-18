import 'package:agri_trust/features/auth/presentation/views/widgets/auth_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_strings.dart';
import '../../../../core/utils/functions/show_success_bottom_dialog.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_text_form_field.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key});

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
                    title: AppStrings.createNewPassword,
                  ),
                  CustomTextFormField(
                    title: AppStrings.newPassword,
                    controller: TextEditingController(),
                    isPassword: true,
                    type: TextInputType.visiblePassword,
                  ),
                  CustomTextFormField(
                    title: AppStrings.confirmPassword,
                    controller: TextEditingController(),
                    isPassword: true,
                    type: TextInputType.visiblePassword,
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  CustomButton(
                    title: AppStrings.updatePassword,
                    onPressed: () {
                      showSuccessBottomDialog(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
