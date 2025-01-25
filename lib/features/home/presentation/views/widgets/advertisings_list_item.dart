import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvertisingsListItem extends StatelessWidget {
  final String imageUrl;

  const AdvertisingsListItem({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    String baseUrl = "https://qrcode.sys-web.net";
    String fullImageUrl = '$baseUrl/uploads/$imageUrl';


    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: CachedNetworkImage(
        imageUrl: fullImageUrl,
        width: 358.w,
        height: 171.h,
        fit: BoxFit.fill,
        placeholder: (context, url) {
          return const Center(child: CircularProgressIndicator());
        },
        errorWidget: (context, url, error) {
          return const Center(child: Text('Image not available'));
        },
      ),
    );
  }
}
