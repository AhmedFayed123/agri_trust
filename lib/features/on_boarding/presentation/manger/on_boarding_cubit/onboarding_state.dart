import '../../../data/models/on_boarding_model.dart';

abstract class OnBoardingState {}

class OnBoardingInitial extends OnBoardingState {}

class OnBoardingLoading extends OnBoardingState {}

class OnBoardingLoaded extends OnBoardingState {
  final OnBoardingResponse response;

  OnBoardingLoaded(this.response);
}

class OnBoardingError extends OnBoardingState {
  final String message;

  OnBoardingError(this.message);
}

class OnBoardingPageChanged extends OnBoardingState {
  final int currentPage;

  OnBoardingPageChanged(this.currentPage);
}

class OnboardingCompleted extends OnBoardingState {}
