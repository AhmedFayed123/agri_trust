class OnBoardingItem {
  final String name;
  final String nameEn;
  final String img;
  final String details;
  final String detailsEn;
  final String link;

  OnBoardingItem({
    required this.name,
    required this.nameEn,
    required this.img,
    required this.details,
    required this.detailsEn,
    required this.link,
  });

  factory OnBoardingItem.fromJson(Map<String, dynamic> json) {
    return OnBoardingItem(
      name: json['name'] ?? '',
      nameEn: json['name_en'] ?? '',
      img: json['img'] ?? '',
      details: json['details'] ?? '',
      detailsEn: json['details_en'] ?? '',
      link: json['link'] ?? '',
    );
  }
}

class OnBoardingResponse {
  final bool result;
  final bool dataStatus;
  final int dataCount;
  final String errorMessage;
  final String errorMessageEn;
  final List<OnBoardingItem> data;

  OnBoardingResponse({
    required this.result,
    required this.dataStatus,
    required this.dataCount,
    required this.errorMessage,
    required this.errorMessageEn,
    required this.data,
  });

  factory OnBoardingResponse.fromJson(Map<String, dynamic> json) {
    return OnBoardingResponse(
      result: json['result'] ?? false,
      dataStatus: json['data_status'] ?? false,
      dataCount: json['data_count'] ?? 0,
      errorMessage: json['error_message'] ?? '',
      errorMessageEn: json['error_message_en'] ?? '',
      data: (json['data'] as List)
          .map((item) => OnBoardingItem.fromJson(item))
          .toList(),
    );
  }
}
