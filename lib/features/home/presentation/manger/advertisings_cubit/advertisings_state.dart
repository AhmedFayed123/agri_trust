
import 'package:equatable/equatable.dart';

import '../../../data/models/home_models.dart';

abstract class AdvertisingsState extends Equatable {
  const AdvertisingsState();

  @override
  List<Object?> get props => [];
}

class AdvertisingsInitial extends AdvertisingsState {}

class AdvertisingsLoading extends AdvertisingsState {}

class AdvertisingsLoaded extends AdvertisingsState {
  final List<AdvertModel> adverts;

  const AdvertisingsLoaded(this.adverts);

  @override
  List<Object?> get props => [adverts];
}

class AdvertisingsError extends AdvertisingsState {
  final String message;

  const AdvertisingsError(this.message);

  @override
  List<Object?> get props => [message];
}
