import '../../../data/models/history_models.dart';

abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistorySuccess extends HistoryState {
  final ScanResponseModel scanResponse;
  HistorySuccess(this.scanResponse);
}

class HistoryFailure extends HistoryState {
  final String errorMessage;
  HistoryFailure(this.errorMessage);
}