import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/app_strings.dart';
import '../../../../core/router/routes.dart';
import '../../data/repos/on_boarding_repo_impl.dart';
import '../manger/on_boarding_cubit/onboarding_cubit.dart';
import '../manger/on_boarding_cubit/onboarding_state.dart';
import 'widgets/custom_on_boarding_button.dart';
import 'widgets/on_boarding_app_bar.dart';
import 'widgets/on_boarding_page.dart';

class OnBoardingView extends StatelessWidget {
  final PageController _pageController = PageController();

  OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      OnBoardingCubit(OnBoardingRepoImpl())..fetchOnBoardingData(),
      child: Scaffold(
        body: BlocConsumer<OnBoardingCubit, OnBoardingState>(
          listener: (context, state) {
            if (state is OnboardingCompleted) {
              context.go(AppRoutes.auth);
            }
          },
          builder: (context, state) {
            final cubit = context.read<OnBoardingCubit>();

            if (state is OnBoardingLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is OnBoardingError) {
              return Center(
                child: Text(
                  state.message,
                  style: TextStyle(color: Colors.red, fontSize: 16.sp),
                ),
              );
            } else if (state is OnBoardingLoaded) {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // AppBar
                      OnBoardingAppBar(
                        currentPage: cubit.currentPage,
                        totalPages: cubit.onboardingPages.length,
                        onBackPressed: () {
                          if (cubit.currentPage > 0) {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        onSkipPressed: cubit.completeOnboarding,
                      ),
                      SizedBox(height: 20.h),

                      // PageView
                      SizedBox(
                        height: .6.sh,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: cubit.onboardingPages.length,
                          onPageChanged: cubit.updatePage,
                          itemBuilder: (context, index) {
                            final page = cubit.onboardingPages[index];
                            return OnBoardingPage(
                              imageUrl: page.img,
                              title: page.name,
                              description: page.details,
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: cubit.currentPage == cubit.onboardingPages.length - 1
                            ? CustomOnBoardingButton(
                          text: AppStrings.getStarted,
                          onPressed: cubit.completeOnboarding,
                        )
                            : CustomOnBoardingButton(
                          text: AppStrings.next,
                          onPressed: () {
                            if (cubit.currentPage < cubit.onboardingPages.length - 1) {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
