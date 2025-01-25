import 'package:agri_trust/core/constant/app_colors.dart';
import 'package:agri_trust/core/constant/app_styles.dart';
import 'package:agri_trust/features/auth/presentation/views/widgets/auth_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/constant/app_strings.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../data/repos/auth_repo_impl.dart';
import '../manger/auth_cubit/auth_cubit.dart';
import '../manger/auth_cubit/auth_state.dart';

class CodeVerificationView extends StatelessWidget {
  const CodeVerificationView({super.key, required this.id, required this.phoneNumber});

  final int id;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    final codeController = TextEditingController();

    return BlocProvider(
      create: (_) => AuthCubit(AuthRepoImpl()),
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is AuthLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AuthAppBar(
                          title: AppStrings.digitalCode,
                          subTitle: '${AppStrings.digitalCodeSubTitle}$phoneNumber',
                        ),
                        SizedBox(height: 50.h),
                        SizedBox(
                          width: 264.w,
                          child: PinCodeTextField(
                            keyboardType: TextInputType.number,
                            appContext: context,
                            length: 4,
                            controller: codeController,
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
                            onChanged: (value) {},
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                context.read<AuthCubit>().sendResetCode(phoneNumber, context);
                              },
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
                        SizedBox(height: 36.h),
                        CustomButton(
                          title: AppStrings.next,
                          onPressed: () {
                            String code = codeController.text.trim();
                            if (code.isEmpty || code.length != 4) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('يرجى إدخال رمز صحيح مكون من 4 أرقام.'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            } else {
                              context.read<AuthCubit>().checkOtp(code, id, context);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
