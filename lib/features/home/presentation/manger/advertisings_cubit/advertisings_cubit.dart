import 'package:agri_trust/core/services/token_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/home_repo.dart';
import 'advertisings_state.dart';

class AdvertisingsCubit extends Cubit<AdvertisingsState> {
  final HomeRepo _homeRepo;

  AdvertisingsCubit(this._homeRepo) : super(AdvertisingsInitial());

  Future<void> fetchAdvertisings() async {
    try {
      emit(AdvertisingsLoading());
      final adverts = await _homeRepo.fetchAdverts();
      emit(AdvertisingsLoaded(adverts));
    } catch (e) {
      emit(AdvertisingsError(e.toString()));
    }
  }
}
