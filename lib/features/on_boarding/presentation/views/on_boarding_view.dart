import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_strings.dart';
import '../../../../core/resources/assets_path.dart';
import '../../../../core/router/routes.dart';
import '../manger/on_boarding_cubit/onboarding_cubit.dart';
import '../manger/on_boarding_cubit/onboarding_state.dart';
import 'widgets/custom_on_boarding_button.dart';
import 'widgets/on_boarding_app_bar.dart';
import 'widgets/on_boarding_page.dart';

class OnBoardingView extends StatelessWidget {
  OnBoardingView({super.key});

  final onboardingPages = [
    const OnBoardingPage(
      imagePath: AssetsPath.onBoardingQrCodeImage,
      title: AppStrings.easyToScanTitle,
      description: AppStrings.easyToScanDescription,
    ),
    const OnBoardingPage(
      imagePath: AssetsPath.myPasswordImage,
      title: AppStrings.easyToManageTitle,
      description: AppStrings.easyToManageDescription,
      isSecondScreen: true,
    ),
    const OnBoardingPage(
      imagePath: AssetsPath.onBoardingQrCodeImage,
      title: AppStrings.easyToTrustTitle,
      description: AppStrings.easyToTrustDescription,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: Scaffold(
        body: BlocConsumer<OnboardingCubit, OnboardingState>(
          listener: (context, state) {
            if (state is OnboardingCompleted) {
              context.go(AppRoutes.auth);
            }
          },
          builder: (context, state) {
            final cubit = context.read<OnboardingCubit>();
            PageController pageController =
            PageController(initialPage: cubit.currentPage);

            return SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double screenHeight = constraints.maxHeight;
                  double screenWidth = constraints.maxWidth;

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        OnBoardingAppBar(
                          currentPage: cubit.currentPage,
                          totalPages: 3,
                          onBackPressed: () {
                            cubit.updatePage(cubit.currentPage - 1);
                            pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                          onSkipPressed: () {
                            cubit.completeOnboarding();
                          },
                        ),

                        SizedBox(height: 20.h),

                        SizedBox(
                          height: screenHeight * 0.6,
                          child: PageView.builder(
                            controller: pageController,
                            onPageChanged: (index) => cubit.updatePage(index),
                            itemCount: onboardingPages.length,
                            itemBuilder: (context, index) =>
                            onboardingPages[index],
                          ),
                        ),
                        SizedBox(height: 20.h),

                        cubit.currentPage == onboardingPages.length - 1
                            ? CustomOnBoardingButton(
                          text: AppStrings.getStarted,
                          onPressed: () {
                            cubit.completeOnboarding();
                          },
                        )
                            : CustomOnBoardingButton(
                          text: AppStrings.next,
                          onPressed: () {
                            cubit.updatePage(cubit.currentPage + 1);
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
