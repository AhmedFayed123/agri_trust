import 'package:agri_trust/core/utils/functions/show_success_bottom_dialog.dart';
import 'package:agri_trust/features/auth/presentation/views/widgets/auth_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_strings.dart';
import '../../../../core/utils/widgets/custom_button.dart';
import '../../../../core/utils/widgets/custom_text_form_field.dart';
import '../../data/repos/auth_repo_impl.dart';
import '../manger/auth_cubit/auth_cubit.dart';
import '../manger/auth_cubit/auth_state.dart';

class CreateNewPasswordView extends StatelessWidget {
  final int userId;

  const CreateNewPasswordView({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return BlocProvider(
      create: (_) => AuthCubit(AuthRepoImpl()),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is ResetPasswordSuccessState) {
                    showSuccessBottomDialog(context);
                  } else if (state is ResetPasswordErrorState) {

                  }
                },
                builder: (context, state) {
                  final cubit = context.read<AuthCubit>();

                  return SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const AuthAppBar(
                          title: AppStrings.createNewPassword,
                        ),
                        CustomTextFormField(
                          title: AppStrings.newPassword,
                          controller: newPasswordController,
                          isPassword: true,
                          type: TextInputType.visiblePassword,
                          obscureText: cubit.obscurePassword,
                          onToggleVisibility: () =>
                              cubit.togglePasswordVisibility(),
                        ),
                        CustomTextFormField(
                          title: AppStrings.confirmPassword,
                          controller: confirmPasswordController,
                          isPassword: true,
                          type: TextInputType.visiblePassword,
                          obscureText: cubit.obscurePassword,
                          onToggleVisibility: () =>
                              cubit.togglePasswordVisibility(),
                        ),
                        SizedBox(height: 36.h),
                        if (state is AuthLoadingState)
                          const CircularProgressIndicator()
                        else
                          CustomButton(
                            title: AppStrings.updatePassword,
                            onPressed: () {
                              cubit.updatePassword(
                                newPasswordController.text.trim(),
                                confirmPasswordController.text.trim(),
                                context,
                                userId,
                              );
                            },
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
