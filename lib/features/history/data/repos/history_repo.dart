import '../models/history_models.dart';

abstract class HistoryRepo {
  Future<ScanResponseModel> fetchUserSuccessScan();
  Future<ScanResponseModel> fetchUserFailedScan();
}