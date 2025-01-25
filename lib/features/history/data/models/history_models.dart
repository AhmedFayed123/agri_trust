class ScanResponseModel {
  final bool result;
  final bool dataStatus;
  final int dataCount;
  final String errorMessage;
  final List<ScanModel> data;

  ScanResponseModel({
    required this.result,
    required this.dataStatus,
    required this.dataCount,
    required this.errorMessage,
    required this.data,
  });

  factory ScanResponseModel.fromJson(Map<String, dynamic> json) {
    return ScanResponseModel(
      result: json['result'],
      dataStatus: json['data_status'],
      dataCount: json['data_count'],
      errorMessage: json['error_message'] ?? '',
      data: (json['data'] as List)
          .map((item) => ScanModel.fromJson(item))
          .toList(),
    );
  }
}
class ScanModel {
  final int id;
  final String scanStatus;
  final int productId;
  final int productItemId;
  final int companyId;
  final Product product;
  final ProductItem? productItem;
  final Company company;

  ScanModel({
    required this.id,
    required this.scanStatus,
    required this.productId,
    required this.productItemId,
    required this.companyId,
    required this.product,
    this.productItem,
    required this.company,
  });

  factory ScanModel.fromJson(Map<String, dynamic> json) {
    return ScanModel(
      id: json['id'],
      scanStatus: json['scan_status'],
      productId: json['product_id'],
      productItemId: json['product_item_id'],
      companyId: json['company_id'],
      product: Product.fromJson(json['product']),
      productItem: json['product_item'] != null
          ? ProductItem.fromJson(json['product_item'])
          : null,
      company: Company.fromJson(json['company']),
    );
  }
}
class Product {
  final int id;
  final String name;
  final String nameEn;
  final String details;
  final String detailsEn;

  Product({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.details,
    required this.detailsEn,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      nameEn: json['name_en'],
      details: json['details'],
      detailsEn: json['details_en'],
    );
  }
}
class ProductItem {
  final int id;
  final int numViews;

  ProductItem({
    required this.id,
    required this.numViews,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
      id: json['id'],
      numViews: json['num_views'],
    );
  }
}
class Company {
  final int id;
  final String name;
  final String nameEn;
  final String details;
  final String detailsEn;

  Company({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.details,
    required this.detailsEn,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      name: json['name'],
      nameEn: json['name_en'],
      details: json['details'],
      detailsEn: json['details_en'],
    );
  }
}
