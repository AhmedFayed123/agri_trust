import 'package:agri_trust/core/services/token_service.dart';
import 'package:agri_trust/features/home/data/models/home_models.dart';
import 'package:agri_trust/features/home/data/models/profile_model.dart';
import 'package:agri_trust/features/home/data/repos/home_repo.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/network_service.dart';

class HomeRepoImpl implements HomeRepo {
  final Dio dio = Dio();
  final NetworkService _networkService = NetworkService();

  @override
  Future<List<AdvertModel>> fetchAdverts() async {
    try {
      final response = await _networkService.getRequest(ApiEndpoints.advert);

      if (response.data != null &&
          response.data['result'] == true &&
          response.data['data_status'] == true) {
        final List<dynamic> advertsJson = response.data['data'];
        return advertsJson.map((json) => AdvertModel.fromJson(json)).toList();
      } else {
        throw Exception('No data available');
      }
    } on DioException catch (e) {
      throw Exception('Failed to fetch adverts: ${e.message}');
    }
  }

  @override
  Future<Profile> fetchUserProfile() async {
    try {
      final token = await TokenService.getToken();

      if (token == null || token.isEmpty) {
        throw Exception("Token is not available");
      }

      final response = await _networkService.getRequest(
        ApiEndpoints.profile,
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
          return Profile.fromJson(data['data']);
        } else {
          throw Exception(data['error_message'] ?? "Failed to fetch profile");
        }
      } else {
        throw Exception("HTTP Error: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to fetch profile: ${e.toString()}");
    }
  }
  @override
  Future<List<ProductModel>> fetchProducts() async {
    try {
      final token = await TokenService.getToken();

      if (token == null || token.isEmpty) {
        throw Exception('Token is not available or invalid');
      }

      final response = await _networkService.getRequest(
        ApiEndpoints.products,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'client_id': '9e099e57-7ac9-4b35-809f-c61c6939a86e',
            'secret_id': 'Wh1YlwbZXCqlrUszpWaz9el1AbDQPJ5kyEMasbl4',
            'lang': 'en',
            'grant_type': 'password',
          },
        ),
      );

      if (response.statusCode == 200) {
        var data = response.data['data'];
        if (data != null && data is List) {
          return data.map((item) => ProductModel.fromJson(item)).toList();
        } else {
          throw Exception('Invalid product data format');
        }
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }


}
