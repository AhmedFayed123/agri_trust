import 'package:agri_trust/core/constant/app_colors.dart';
import 'package:agri_trust/core/constant/app_strings.dart';
import 'package:agri_trust/core/constant/app_styles.dart';
import 'package:agri_trust/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/resources/assets_path.dart';
import '../../manger/bottom_nav_bar_cubit/navigation_cubit.dart';
import '../../manger/bottom_nav_bar_cubit/navigation_state.dart';
import 'nav_bar_icon_button_with_label.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        final cubit = context.read<NavigationCubit>();
        int selectedIndex = 0;
        if (state is NavigationSelected) {
          selectedIndex = state.selectedIndex;
        }

        return SizedBox(
          height: 97.h,
          child: Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 71.h,
                  width: 343.w,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButtonWithLabel(
                        icon: AssetsPath.history,
                        label: AppStrings.history,
                        isSelected: selectedIndex == 1,
                        onTap: () => cubit.navigateTo(1),
                      ),
                      IconButtonWithLabel(
                        icon: AssetsPath.home,
                        label: AppStrings.home,
                        isSelected: selectedIndex == 0,
                        onTap: () {
                          cubit.navigateTo(0);
                        },
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -25.h,
                  left: (375.w - 83.w) / 2,
                  child: InkWell(
                    onTap: () {
                      context.go(AppRoutes.scanBarcodeView);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.secondary,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.secondary.withOpacity(0.4),
                                spreadRadius: 4,
                                blurRadius: 12,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Image.asset(
                              AssetsPath.scanCode,
                              width: 28.57.w,
                              height: 28.57.h,
                            ),
                          ),
                        ),
                        Text(
                          AppStrings.scan,
                          style: AppStyles.bodyText14.copyWith(color: AppColors.black2),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

