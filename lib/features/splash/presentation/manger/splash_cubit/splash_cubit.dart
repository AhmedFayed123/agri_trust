import 'package:agri_trust/core/router/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final GoRouter goRouter;

  SplashCubit({required this.goRouter}) : super(SplashInitial());

  void startSplash(BuildContext context) async {
    emit(SplashLoading());

    await Future.delayed(const Duration(seconds: 5));

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isOnboardingSeen = prefs.getBool('onboarding_seen') ?? false;

    if (isOnboardingSeen) {
      goRouter.go(AppRoutes.auth);
    } else {
      goRouter.go(AppRoutes.onBoarding);
    }

    emit(SplashFinished());
  }
}
