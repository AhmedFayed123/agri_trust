import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/errors/server_failures.dart';
import '../../../data/models/on_boarding_model.dart';
import '../../../data/repos/on_boarding_repo.dart';
import 'onboarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit(this._onBoardingRepo) : super(OnBoardingInitial());

  int currentPage = 0;
  List<OnBoardingItem> onboardingPages = [];
  final OnBoardingRepo _onBoardingRepo;

  void updatePage(int index) {
    currentPage = index;
    emit(OnBoardingLoaded(OnBoardingResponse(
      result: true,
      dataStatus: true,
      dataCount: onboardingPages.length,
      errorMessage: '',
      errorMessageEn: '',
      data: onboardingPages,
    )));
  }

  Future<void> fetchOnBoardingData() async {
    if (onboardingPages.isNotEmpty) {
      emit(OnBoardingLoaded(OnBoardingResponse(
        result: true,
        dataStatus: true,
        dataCount: onboardingPages.length,
        errorMessage: '',
        errorMessageEn: '',
        data: onboardingPages,
      )));
      return;
    }

    emit(OnBoardingLoading());
    try {
      final response = await _onBoardingRepo.fetchOnBoardingData();
      onboardingPages = response.data;
      emit(OnBoardingLoaded(response));
    } on ServerFailure catch (e) {
      emit(OnBoardingError(e.message));
    } catch (e) {
      emit(OnBoardingError('Unexpected error occurred.'));
    }
  }

  // إنهاء OnBoarding
  Future<void> completeOnboarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_seen', true);
    emit(OnboardingCompleted());
  }
}
