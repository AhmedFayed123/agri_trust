import 'package:agri_trust/features/qr_code_scanner/presentation/manger/product_cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  void scanBarcode(String barcode) {
    emit(ProductScanned(barcode));
  }
}
