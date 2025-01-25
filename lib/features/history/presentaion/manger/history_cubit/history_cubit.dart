import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/history_repo.dart';
import 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final HistoryRepo _historyRepo;

  HistoryCubit(this._historyRepo) : super(HistoryInitial());

  Future<void> fetchUserSuccessScan() async {
    emit(HistoryLoading());
    try {
      final scanResponse = await _historyRepo.fetchUserSuccessScan();
      emit(HistorySuccess(scanResponse));
    } catch (e) {
      emit(HistoryFailure(e.toString()));
    }
  }

  Future<void> fetchUserFailedScan() async {
    emit(HistoryLoading());
    try {
      final scanResponse = await _historyRepo.fetchUserFailedScan();
      emit(HistorySuccess(scanResponse));
    } catch (e) {
      emit(HistoryFailure(e.toString()));
    }
  }
}
