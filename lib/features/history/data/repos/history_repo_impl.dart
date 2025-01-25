import 'package:agri_trust/features/history/data/models/history_models.dart';
import 'package:agri_trust/features/history/data/repos/history_repo.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/network_service.dart';
import '../../../../core/services/token_service.dart';

class HistoryRepoImpl implements HistoryRepo{
  final Dio dio = Dio();
  final NetworkService _networkService = NetworkService();

  @override
  Future<ScanResponseModel> fetchUserSuccessScan() async {
    try {
      final token = await TokenService.getToken();

      if (token == null || token.isEmpty) {
        throw Exception("Token is not available");
      }

      final response = await _networkService.getRequest(
        ApiEndpoints.userSuccessScan,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'client_id': '9e099e57-7ac9-4b35-809f-c61c6939a86e',
            'secret_id': 'Wh1YlwbZXCqlrUszpWaz9el1AbDQPJ5kyEMasbl4',
            'lang': 'en',
            'grant_type': 'password',
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data['result'] == true && data['data_status'] == true) {
          return ScanResponseModel.fromJson(data);
        } else {
          throw Exception(data['error_message'] ?? "Failed to fetch success scans");
        }
      } else {
        throw Exception("HTTP Error: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to fetch success scans: ${e.toString()}");
    }
  }

  @override
  Future<ScanResponseModel> fetchUserFailedScan() async {
    try {
      final token = await TokenService.getToken();

      if (token == null || token.isEmpty) {
        throw Exception("Token is not available");
      }

      final response = await _networkService.getRequest(
        ApiEndpoints.userFailedScan,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'client_id': '9e099e57-7ac9-4b35-809f-c61c6939a86e',
            'secret_id': 'Wh1YlwbZXCqlrUszpWaz9el1AbDQPJ5kyEMasbl4',
            'lang': 'en',
            'grant_type': 'password',
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data['result'] == true && data['data_status'] == true) {
          return ScanResponseModel.fromJson(data);
        } else {
          throw Exception(data['error_message'] ?? "Failed to fetch failed scans");
        }
      } else {
        throw Exception("HTTP Error: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to fetch failed scans: ${e.toString()}");
    }
  }

}