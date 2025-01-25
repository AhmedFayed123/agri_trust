
abstract class ScanProductState {}

class ScanProductInitial extends ScanProductState {}

class ScanProductLoading extends ScanProductState {}

class ScanProductSuccess extends ScanProductState {
  final dynamic data;

  ScanProductSuccess(this.data);
}

class ScanProductError extends ScanProductState {
  final String errorMessage;

  ScanProductError(this.errorMessage);
}
