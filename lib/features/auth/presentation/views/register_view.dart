import 'package:agri_trust/core/constant/app_icons.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:agri_trust/core/constant/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_text_form_field.dart';
import '../manger/auth_cubit/auth_cubit.dart';
import '../manger/auth_cubit/auth_state.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomTextFormField(
                        width: 163.5,
                        title: AppStrings.firstName,
                        controller: cubit.firstNameController,
                        type: TextInputType.name,
                        errorText: state is RegisterErrorState
                            ? state.firstNameError
                            : null,
                      ),
                      SizedBox(width: 16.w),
                      CustomTextFormField(
                        width: 163.5,
                        title: AppStrings.lastName,
                        controller: cubit.lastNameController,
                        type: TextInputType.name,
                        errorText: state is RegisterErrorState
                            ? state.lastNameError
                            : null,
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  CustomTextFormField(
                    title: AppStrings.email,
                    controller: cubit.registerEmailController,
                    type: TextInputType.emailAddress,
                    errorText:
                        state is RegisterErrorState ? state.emailError : null,
                  ),
                  SizedBox(height: 14.h),
                  Container(
                    width: 343.w,
                    height: 46.h,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: IntlPhoneField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.phone,

                      controller: cubit.phoneController,
                      initialCountryCode: 'EG',
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      onChanged: (phone) {
                        cubit.phoneController.text = phone.number;

                      },
                    ),
                  ),
                  SizedBox(height: 14.h),
                  CustomTextFormField(
                    title: AppStrings.password,
                    controller: cubit.registerPasswordController,
                    isPassword: true,
                    obscureText: cubit.obscurePassword,
                    onToggleVisibility: cubit.togglePasswordVisibility,
                    type: TextInputType.visiblePassword,
                    errorText: state is RegisterErrorState
                        ? state.passwordError
                        : null,
                  ),
                  SizedBox(height: 49.h),
                  CustomButton(
                    title: AppStrings.signUp,
                    icon: AppIcons.arrowForward,
                    onPressed: () {
                      cubit.register(context);
                    },
                    isLoading: state is AuthLoadingState,
                    buttonColor: AppColors.customGreen,
                    textColor: AppColors.primary,
                    borderRadius: 10.0.r,
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
