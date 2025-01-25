import '../models/home_models.dart';
import '../models/profile_model.dart';

abstract class HomeRepo {
  Future<List<AdvertModel>> fetchAdverts();
  Future<Profile> fetchUserProfile();
  Future<List<ProductModel>> fetchProducts();
}