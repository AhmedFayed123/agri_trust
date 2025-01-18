import 'package:agri_trust/features/auth/presentation/views/widgets/auth_app_bar.dart';
import 'package:agri_trust/features/auth/presentation/views/widgets/auth_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_strings.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 700.h),
            child: const Column(
              children: [
                AuthAppBar(title: AppStrings.getStartedNow, subTitle: AppStrings.authSubTitle,),
                Expanded(child: AuthViewBody()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
