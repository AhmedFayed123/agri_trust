import 'package:agri_trust/features/qr_code_scanner/data/repos/scanning_repo.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/network_service.dart';
import '../../../../core/services/token_service.dart';

class ScanningRepoImpl implements ScanningRepo {
  final Dio dio = Dio();
  final NetworkService _networkService = NetworkService();

  @override
  Future<void> scanProduct(String qrcode) async {
    try {
      final token = await TokenService.getToken();

      if (token == null || token.isEmpty) {
        throw Exception('Token is null or empty');
      }

      final headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'client_id': '9e099e57-7ac9-4b35-809f-c61c6939a86e',
        'secret_id': 'Wh1YlwbZXCqlrUszpWaz9el1AbDQPJ5kyEMasbl4',
        'lang': 'en',
        'grant_type': 'password',
        'Authorization': 'Bearer $token',
      };

      final body = {
        'qrcode': qrcode,
      };

      final response = await _networkService.postRequest(
        ApiEndpoints.scanProduct,
        data: body,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        print('Scan product successful: ${response.data}');
      } else {
        print('Failed to scan product. Status code: ${response.statusCode}');
        print('Response: ${response.data}');
      }
    } catch (e) {
      print('Error during API request: $e');
    }
  }
}
