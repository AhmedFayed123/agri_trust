import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/token_service.dart';
import '../profile_cubit/profile_cubit.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {

  HomeCubit() : super(HomeInitialState());

  Future<void> fetchTokenAndProfile(BuildContext context) async {
    try {
      emit(HomeLoadingState());
      final token = await TokenService.getToken();
      if (token != null) {
        emit(HomeLoadedState(token));
        context.read<ProfileCubit>().fetchUserProfile();
      } else {
        emit(HomeErrorState("Token not found!"));
      }
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      await TokenService.clearToken();
      emit(LogoutSuccessState());
    } catch (e) {
      emit(LogoutFailureState(e.toString()));
    }
  }
}
