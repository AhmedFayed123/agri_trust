
import 'package:agri_trust/features/qr_code_scanner/presentation/manger/product_cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/scanning_repo_impl.dart';

class ProductCubit extends Cubit<ScanProductState> {
  final ScanningRepoImpl scanningRepo;

  ProductCubit({ScanningRepoImpl? scanningRepo})
      : scanningRepo = scanningRepo ?? ScanningRepoImpl(),
        super(ScanProductInitial());

  Future<void> scanProduct(String qrcode) async {
    try {
      emit(ScanProductLoading());
      await scanningRepo.scanProduct(qrcode);
      emit(ScanProductSuccess('تم مسح المنتج بنجاح'));
    } catch (e) {
      emit(ScanProductError('حدث خطأ: $e'));
    }
  }
}
