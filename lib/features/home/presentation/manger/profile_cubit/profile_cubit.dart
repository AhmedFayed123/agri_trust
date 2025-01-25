import 'package:agri_trust/features/home/presentation/manger/profile_cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/home_repo.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final HomeRepo homeRepo;

  ProfileCubit(this.homeRepo) : super(ProfileInitial());

  Future<void> fetchUserProfile() async {
    emit(ProfileLoading());
    try {
        final profile = await homeRepo.fetchUserProfile();
        emit(ProfileLoaded(profile));

    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
