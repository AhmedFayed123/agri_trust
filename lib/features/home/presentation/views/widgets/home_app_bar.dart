import 'package:agri_trust/core/constant/app_colors.dart';
import 'package:agri_trust/core/constant/app_styles.dart';
import 'package:agri_trust/core/resources/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/repos/home_repo_impl.dart';
import '../../manger/profile_cubit/profile_cubit.dart';
import '../../manger/profile_cubit/profile_state.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(HomeRepoImpl())..fetchUserProfile(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileLoaded) {
            final profile = state.profile;
            return Center(
              child: Container(
                width: 343.w,
                height: 62.h,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.4, color: AppColors.border),
                  ),
                  color: AppColors.primary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.gray.withOpacity(0.5),
                                    spreadRadius: 0,
                                    blurRadius: 17.6,
                                    offset: const Offset(0, 6.4),
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                backgroundColor: AppColors.primary,
                                radius: 40.r,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40.r),
                                  child: Image.asset(
                                    height: 52.h,
                                    width: 52.w,
                                    AssetsPath.profile,
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              left: 5,
                              child: Container(
                                width: 17.6.w,
                                height: 17.6.h,
                                decoration: BoxDecoration(
                                  color: AppColors.onLineIconColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: AppColors.primary),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              profile.name,
                              style: AppStyles.tajawal14,
                            ),
                            // Row(
                            //   children: [
                            //     Text(
                            //       AppStrings.profileCountry,
                            //       style: AppStyles.tajawal12,
                            //     ),
                            //     Text(
                            //       AppStrings.comma,
                            //       style: AppStyles.tajawal12,
                            //     ),
                            //     Text(
                            //       AppStrings.profileCity,
                            //       style: AppStyles.tajawal12,
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: onPressed,
                      child: Image.asset(
                        AssetsPath.streamIcon,
                        width: 26.8.w,
                        height: 23.45.h,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is ProfileError) {
            return Center(
              child: Text(
                'Error: ${state.message}',
                style: TextStyle(color: Colors.red, fontSize: 16.sp),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
// );
// return Padding(
// padding: EdgeInsets.all(16.w),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text('Name: ${profile.name}', style: TextStyle(fontSize: 18.sp)),
// SizedBox(height: 10.h),
// Text('Email: ${profile.email}', style: TextStyle(fontSize: 18.sp)),
// SizedBox(height: 10.h),
// Text('Phone: ${profile.phone ?? "N/A"}', style: TextStyle(fontSize: 18.sp)),
// SizedBox(height: 10.h),
// Text('User Points: ${profile.userPoints}', style: TextStyle(fontSize: 18.sp)),
// ],
// ),
// );
