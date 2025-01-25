import 'package:agri_trust/core/constant/app_strings.dart';
import 'package:agri_trust/core/constant/app_styles.dart';
import 'package:agri_trust/core/resources/assets_path.dart';
import 'package:agri_trust/core/utils/widgets/custom_text_form_field.dart';
import 'package:agri_trust/features/auth/presentation/views/widgets/check_box_row.dart';
import 'package:agri_trust/core/utils/widgets/custom_button.dart';
import 'package:agri_trust/features/auth/presentation/views/widgets/line_widget.dart';
import 'package:agri_trust/features/auth/presentation/views/widgets/social_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agri_trust/features/auth/presentation/manger/auth_cubit/auth_cubit.dart';
import 'package:agri_trust/features/auth/presentation/manger/auth_cubit/auth_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_colors.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final cubit = context.read<AuthCubit>();

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextFormField(
                    title: AppStrings.email,
                    controller: cubit.loginEmailController,
                    type: TextInputType.emailAddress,
                    errorText: state is LoginErrorState
                        ? state.emailError
                        : null,
                  ),
                  SizedBox(height: 14.h),
                  CustomTextFormField(
                    title: AppStrings.password,
                    controller: cubit.loginPasswordController,
                    isPassword: true,
                    obscureText: cubit.obscurePassword,
                    onToggleVisibility: cubit.togglePasswordVisibility,
                    type: TextInputType.visiblePassword,
                    errorText: state is LoginErrorState
                        ? state.passwordError
                        : null,
                  ),
                  SizedBox(height: 14.h),
                  const CheckBoxRow(),
                  SizedBox(height: 16.h),
                  CustomButton(
                    title: AppStrings.login,
                    onPressed: () {
                      cubit.loginWithEmail(context);
                    },
                    isLoading: state is AuthLoadingState,
                    buttonColor: AppColors.customGreen,
                    textColor: AppColors.primary,
                    borderRadius: 10.0,
                    padding:
                    EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
                  ),
                  // SizedBox(height: 50.h),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const LineWidget(),
                  //     Text(
                  //       AppStrings.orLoginWith,
                  //       style: AppStyles.bodyText12,
                  //     ),
                  //     const LineWidget(),
                  //   ],
                  // ),
                  // SizedBox(height: 20.h),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     SocialItem(
                  //       onPressed: () {}, imagePath: AssetsPath.google,),
                  //     SocialItem(
                  //       onPressed: () {}, imagePath: AssetsPath.faceBook,),
                  //     SocialItem(
                  //       onPressed: () {}, imagePath: AssetsPath.apple,),
                  //   ],
                  // ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
