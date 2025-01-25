
import '../../../../core/errors/server_failures.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/network_service.dart';
import '../models/on_boarding_model.dart';
import 'on_boarding_repo.dart';

class OnBoardingRepoImpl implements OnBoardingRepo {
  final NetworkService _networkService = NetworkService();

  @override
  Future<OnBoardingResponse> fetchOnBoardingData() async {
    try {
      final response = await _networkService.getRequest(ApiEndpoints.onBoarding);
      return OnBoardingResponse.fromJson(response.data);
    } on ServerFailure catch (e) {
      throw Exception(e.message);
    }
  }
}