import 'package:agri_trust/core/constant/app_colors.dart';
import 'package:agri_trust/core/constant/app_strings.dart';
import 'package:agri_trust/core/constant/app_styles.dart';
import 'package:agri_trust/core/resources/assets_path.dart';
import 'package:agri_trust/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../manger/home_cubit/home_cubit.dart';
import '../../manger/home_cubit/home_state.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      backgroundColor: AppColors.primary,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
          child: BlocListener<HomeCubit, HomeState>(
            listener: (context, state) {
              if (state is LogoutSuccessState) {
                Navigator.of(context).pop();
              } else if (state is LogoutFailureState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30.r,
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              AssetsPath.profile,
                              width: 60.w,
                              height: 60.h,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            AppStrings.profileName,
                            style: AppStyles.tajawal16,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 24.w,
                          height: 24.h,
                          decoration: const BoxDecoration(
                            color: AppColors.darkCharcoal,
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.close,
                              size: 22,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.home_outlined,
                    size: 24.sp,
                  ),
                  title: Text(
                    AppStrings.home,
                    style: AppStyles.tajawal16.copyWith(color: AppColors.onyx),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.login_outlined,
                    size: 24.sp,
                    color: AppColors.bernRed,
                  ),
                  title: Text(
                    AppStrings.logout,
                    style: AppStyles.tajawal16.copyWith(color: AppColors.onyx),
                  ),
                  onTap: () {
                    context.go(AppRoutes.auth);
                    context.read<HomeCubit>().logout(context);

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:agri_trust/core/constant/app_colors.dart';
// import 'package:agri_trust/core/constant/app_strings.dart';
// import 'package:agri_trust/core/constant/app_styles.dart';
// import 'package:agri_trust/core/resources/assets_path.dart';
// import 'package:agri_trust/core/router/routes.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
//
// import '../../../../auth/presentation/manger/auth_cubit/auth_cubit.dart';
// import '../../../../auth/presentation/manger/auth_cubit/auth_state.dart';
// import '../../manger/home_cubit/home_cubit.dart';
//
// class DrawerBody extends StatelessWidget {
//   const DrawerBody({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       width: MediaQuery.of(context).size.width*0.8,
//       backgroundColor: AppColors.primary,
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: BlocProvider(
//           create: (context) => HomeCubit(),
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: [
//               DrawerHeader(
//                 decoration: const BoxDecoration(
//                   color: AppColors.primary,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         CircleAvatar(
//                             radius: 30.r,
//                             backgroundColor: Colors.white,
//                             child: Image.asset(
//                               AssetsPath.profile,
//                               width: 60.w,
//                               height: 60.h,
//                             )),
//                         SizedBox(width: 10.w),
//                         Text(
//                           AppStrings.profileName,
//                           style: AppStyles.tajawal16,
//                         ),
//                       ],
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: Container(
//                         width: 24.w,
//                         height: 24.h,
//                         decoration: const BoxDecoration(
//                           color: AppColors.darkCharcoal,
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Center(
//                           child: Icon(
//                             Icons.close,
//                             size: 22,
//                             color: AppColors.primary,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               ListTile(
//                 leading: Icon(
//                   Icons.home_outlined,
//                   size: 24.sp,
//                 ),
//                 title: Text(
//                   AppStrings.home,
//                   style: AppStyles.tajawal16.copyWith(color: AppColors.onyx),
//                 ),
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               // ListTile(
//               //   leading: Icon(
//               //     Icons.credit_card_outlined,
//               //     size: 24.sp,
//               //   ),
//               //   title: Text(
//               //     AppStrings.wallet,
//               //     style: AppStyles.tajawal16.copyWith(color: AppColors.onyx),
//               //   ),
//               //   onTap: () {
//               //     context.go(AppRoutes.wallet);
//               //   },
//               // ),
//               // ListTile(
//               //   leading: Icon(
//               //     Icons.bookmark_border,
//               //     size: 24.sp,
//               //   ),
//               //   title: Text(
//               //     AppStrings.achievements,
//               //     style: AppStyles.tajawal16.copyWith(color: AppColors.onyx),
//               //   ),
//               //   onTap: () {},
//               // ),
//               // ListTile(
//               //   leading: Icon(
//               //     Icons.card_giftcard_outlined,
//               //     size: 24.sp,
//               //   ),
//               //   title: Text(
//               //     AppStrings.gifts,
//               //     style: AppStyles.tajawal16.copyWith(color: AppColors.onyx),
//               //   ),
//               //   onTap: () {},
//               // ),
//               // const Divider(),
//               // ListTile(
//               //   leading: Icon(
//               //     Icons.archive_outlined,
//               //     size: 24.sp,
//               //   ),
//               //   title: Text(
//               //     AppStrings.archive,
//               //     style: AppStyles.tajawal16.copyWith(color: AppColors.onyx),
//               //   ),
//               //   onTap: () {},
//               // ),
//               // ListTile(
//               //   leading: Icon(
//               //     Icons.settings_outlined,
//               //     size: 24.sp,
//               //   ),
//               //   title: Text(
//               //     AppStrings.settings,
//               //     style: AppStyles.tajawal16.copyWith(color: AppColors.onyx),
//               //   ),
//               //   onTap: () {
//               //     context.go(AppRoutes.settings);
//               //   },
//               // ),
//               // ListTile(
//               //   leading: Icon(
//               //     Icons.help_outline,
//               //     size: 24.sp,
//               //   ),
//               //   title: Text(
//               //     AppStrings.termsPrivacySupport,
//               //     style: AppStyles.tajawal16.copyWith(color: AppColors.onyx),
//               //   ),
//               //   onTap: () {},
//               // ),
//               ListTile(
//                 leading: Icon(
//                   Icons.login_outlined,
//                   size: 24.sp,
//                   color: AppColors.bernRed,
//                 ),
//                 title: Text(
//                   AppStrings.logout,
//                   style: AppStyles.tajawal16.copyWith(color: AppColors.onyx),
//                 ),
//                 onTap: () {
//                   context.read<HomeCubit>().logout().then((_) {
//                     context.read<AuthCubit>().emit(AuthInitialState());
//                     Navigator.of(context).pop();
//                     context.go(AppRoutes.auth);
//                   });
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
