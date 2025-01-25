abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final String token;

  HomeLoadedState(this.token);

  @override
  String toString() => 'HomeLoaded(token: $token)';
}

class HomeErrorState extends HomeState {
  final String error;

  HomeErrorState(this.error);

  @override
  String toString() => 'HomeError(error: $error)';
}

class LogoutSuccessState extends HomeState {}

class LogoutFailureState extends HomeState {
  final String error;

  LogoutFailureState(this.error);
}
