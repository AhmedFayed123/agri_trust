import 'package:agri_trust/core/utils/widgets/custom_button.dart';
import 'package:agri_trust/features/auth/presentation/views/widgets/auth_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_strings.dart';
import '../../../../core/utils/widgets/custom_text_form_field.dart';
import '../../data/repos/auth_repo_impl.dart';
import '../manger/auth_cubit/auth_cubit.dart';
import '../manger/auth_cubit/auth_state.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider(
          create: (_) => AuthCubit(AuthRepoImpl()),
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              final cubit = context.read<AuthCubit>();

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const AuthAppBar(
                      title: AppStrings.forgetPassword,
                      subTitle: AppStrings.forgetPasswordSubTitle,
                    ),
                    SizedBox(height: 50.h),
                    CustomTextFormField(
                      title: AppStrings.phoneNumber,
                      controller: phoneController,
                      type: TextInputType.phone,
                      errorText: state is ResetPasswordErrorState
                          ? state.phoneError
                          : null,
                    ),
                    SizedBox(height: 36.h),
                    CustomButton(
                      title: AppStrings.sendCode,
                      onPressed: () {
                        String phoneNumber = phoneController.text.trim();
                        String? phoneError = validatePhone(phoneNumber);

                        if (phoneError != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(phoneError),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          cubit.sendResetCode(phoneNumber, context);
                        }
                      },
                      isLoading: state is AuthLoadingState,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
  String? validatePhone(String phone) {
    phone = phone.replaceAll(RegExp(r'\s+'), '');

    if (phone.isEmpty) {
      return "رقم الهاتف مطلوب.";
    } else if (!RegExp(r"^\+?[0-9]{7,15}$").hasMatch(phone)) {
      return "رقم الهاتف غير صالح. يجب أن يحتوي على 7 إلى 15 رقمًا.";
    }
    return null;
  }

}
