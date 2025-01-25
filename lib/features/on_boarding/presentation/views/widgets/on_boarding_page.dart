import 'package:agri_trust/core/resources/assets_path.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constant/app_styles.dart';

class OnBoardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const OnBoardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    String baseUrl = "https://qrcode.sys-web.net";
    String fullImageUrl = '$baseUrl/uploads/$imageUrl';

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 16.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: fullImageUrl,
              height: 280.h,
              width: 280.w,
              fit: BoxFit.contain,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Image.asset(AssetsPath.onBoardingQrCodeImage),
            ),
            SizedBox(height: 20.h),
            Text(
              title,
              style: AppStyles.headline20,
            ),
            SizedBox(height: 10.h),
            Text(
              description,
              textAlign: TextAlign.center,
              style: AppStyles.bodyText14,
            ),
          ],
        ),
      ),
    );
  }
}
