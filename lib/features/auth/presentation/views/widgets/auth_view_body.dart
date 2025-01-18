import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_strings.dart';
import '../../../../../core/constant/app_styles.dart';
import '../../../data/repos/auth_repo_impl.dart';
import '../../manger/auth_cubit/auth_cubit.dart';
import '../login_view.dart';
import '../register_view.dart';

class AuthViewBody extends StatelessWidget {
  const AuthViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(AuthRepoImpl()),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0.h),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                padding: EdgeInsets.all(2.w),
                height: 36.h,
                decoration: BoxDecoration(
                  color: AppColors.whiteSmock,
                  borderRadius: BorderRadius.circular(7.r),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: AppColors.primary,
                    border: Border.all(
                      color: AppColors.whiteSmock,
                      width: 2.w,
                    ),
                    borderRadius: BorderRadius.circular(6.r),
                  ),

                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: AppStyles.bodyText14,
                  labelColor: AppColors.activeTap,
                  unselectedLabelColor: AppColors.nonActiveTap,
                  indicatorColor: AppColors.whiteSmock,
                  dividerHeight: 0,
                  tabs: const [
                    Tab(text: AppStrings.login),
                    Tab(text: AppStrings.signUp),
                  ],
                ),
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              LoginView(),
              RegisterView(),
            ],
          ),
        ),
      ),
    );
  }
}
