class AdvertModel {
  final int id;
  final String type;
  final String name;
  final String nameEn;
  final String details;
  final String detailsEn;
  final String img;
  final String? imgThumbnail;
  final String urlL;
  final String link;
  final bool isActive;

  AdvertModel({
    required this.id,
    required this.type,
    required this.name,
    required this.nameEn,
    required this.details,
    required this.detailsEn,
    required this.img,
    this.imgThumbnail,
    required this.urlL,
    required this.link,
    required this.isActive,
  });

  factory AdvertModel.fromJson(Map<String, dynamic> json) {
    return AdvertModel(
      id: json['id'],
      type: json['type'],
      name: json['name'],
      nameEn: json['name_en'],
      details: json['details'],
      detailsEn: json['details_en'],
      img: json['img'],
      imgThumbnail: json['img_thumbnail'],
      urlL: json['url_l'],
      link: json['link'],
      isActive: json['is_active'] == "Y",
    );
  }
}
class ProductModel {
  final int id;
  final int companyId;
  final int ord;
  final int type;
  final int seconds;
  final String name;
  final String nameEn;
  final String background;
  final String color;
  final String details;
  final String detailsEn;
  final String? link;
  final int scanType;
  final int maxScan;
  final int companyCode;
  final String barcode;
  final String serialNumber;
  final String? img;
  final String productionDate;
  final String expireDate;
  final String weight;
  final String isActive;
  final int numViews;
  final int quantity;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final int? openScan;
  final int group;

  ProductModel({
    required this.id,
    required this.companyId,
    required this.ord,
    required this.type,
    required this.seconds,
    required this.name,
    required this.nameEn,
    required this.background,
    required this.color,
    required this.details,
    required this.detailsEn,
    this.link,
    required this.scanType,
    required this.maxScan,
    required this.companyCode,
    required this.barcode,
    required this.serialNumber,
    this.img,
    required this.productionDate,
    required this.expireDate,
    required this.weight,
    required this.isActive,
    required this.numViews,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.openScan,
    required this.group,
  });

  // تحويل البيانات من JSON إلى كائن ProductModel
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      companyId: json['company_id'] ?? 0,
      ord: json['ord'] ?? 0,
      type: json['type'] ?? 0,
      seconds: json['seconds'] ?? 0,
      name: json['name'] ?? '',
      nameEn: json['name_en'] ?? '',
      background: json['background'] ?? '',
      color: json['color'] ?? '',
      details: json['details'] ?? '',
      detailsEn: json['details_en'] ?? '',
      link: json['link'],
      scanType: json['scan_type'] ?? 0,
      maxScan: json['max_scan'] ?? 0,
      companyCode: json['company_code'] ?? 0,
      barcode: json['barcode'] ?? '',
      serialNumber: json['serial_number'] ?? '',
      img: json['img'],
      productionDate: json['production_date'] ?? '',
      expireDate: json['expire_date'] ?? '',
      weight: json['weight'] ?? '0.00',
      isActive: json['is_active'] ?? 'Y',
      numViews: json['num_views'] ?? 0,
      quantity: json['quantity'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      deletedAt: json['deleted_at'],
      openScan: json['open_scan'],
      group: json['group'] ?? 0,
    );
  }

  // تحويل الكائن إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'company_id': companyId,
      'ord': ord,
      'type': type,
      'seconds': seconds,
      'name': name,
      'name_en': nameEn,
      'background': background,
      'color': color,
      'details': details,
      'details_en': detailsEn,
      'link': link,
      'scan_type': scanType,
      'max_scan': maxScan,
      'company_code': companyCode,
      'barcode': barcode,
      'serial_number': serialNumber,
      'img': img,
      'production_date': productionDate,
      'expire_date': expireDate,
      'weight': weight,
      'is_active': isActive,
      'num_views': numViews,
      'quantity': quantity,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
      'open_scan': openScan,
      'group': group,
    };
  }
}
