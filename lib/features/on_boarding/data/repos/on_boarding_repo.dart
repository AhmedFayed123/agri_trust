import '../models/on_boarding_model.dart';

abstract class OnBoardingRepo {
  Future<OnBoardingResponse> fetchOnBoardingData();
}
