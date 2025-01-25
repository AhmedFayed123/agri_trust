import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_strings.dart';
import '../../../../../core/constant/app_styles.dart';
import '../../../../../core/router/routes.dart';
import '../../manger/auth_cubit/auth_cubit.dart';
import '../../manger/auth_cubit/auth_state.dart';

class CheckBoxRow extends StatelessWidget {
  const CheckBoxRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return Checkbox(
                  activeColor: AppColors.gray,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.5)),
                  value: context.read<AuthCubit>().rememberMe,
                  onChanged: (value) {
                    context.read<AuthCubit>().toggleRememberMe();
                  },
                );
              },
            ),
            Text(
              AppStrings.rememberMe,
              style: AppStyles.bodyText12
                  .copyWith(fontWeight: FontWeight.w500, color: AppColors.gray),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            context.go(AppRoutes.forgetPassword);
          },
          child: Text(
            AppStrings.forgotPassword,
            style: AppStyles.bodyText12
                .copyWith(fontWeight: FontWeight.w500, color: AppColors.black),
          ),
        ),
      ],
    );
  }
}
