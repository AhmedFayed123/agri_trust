import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constant/app_strings.dart';
import '../../../../../core/router/routes.dart';
import '../../../../../core/utils/widgets/custom_app_bar.dart';
import 'custom_settings_item.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppBar(
            title: AppStrings.settings,
            onPressed: () => context.go(AppRoutes.home),
          ),
          SizedBox(height: 20.h),
          const CustomSettingsItem(title: 'الاهتزاز', subTitle: 'الاهتزاز عند الانتهاء من الفحص', icon: Icons.share,),
        ],
      ),
    );
  }
}
