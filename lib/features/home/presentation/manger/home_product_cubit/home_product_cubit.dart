
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/home_repo.dart';
import 'home_product_state.dart';

class HomeProductCubit extends Cubit<HomeProductState> {
  final HomeRepo homeRepo;

  HomeProductCubit(this.homeRepo) : super(HomeProductLoading());

  Future<void> fetchProducts() async {
    try {
      emit(HomeProductLoading());
      final products = await homeRepo.fetchProducts();
      emit(HomeProductLoaded(products));
    } catch (e) {
      emit(HomeProductError('Error fetching products: $e'));
    }
  }
}
