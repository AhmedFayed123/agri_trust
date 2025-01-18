import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial());

  void navigateTo(int index) {
    if (state is! NavigationSelected || (state as NavigationSelected).selectedIndex != index) {
      emit(NavigationSelected(index));
    }
  }
}
