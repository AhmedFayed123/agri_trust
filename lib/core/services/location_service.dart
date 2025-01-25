//
// Future<void> getLocation() async {
//   bool serviceEnabled;
//   LocationPermission permission;
//
//   // تحقق من تمكين خدمات الموقع
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     // خدمات الموقع غير مفعلّة
//     print('Location services are disabled.');
//     return;
//   }
//
//   // تحقق من أذونات الموقع
//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
//       // إذن الموقع مرفوض
//       print('Location permission denied.');
//       return;
//     }
//   }
//
//   // الحصول على الموقع الحالي
//   Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//   double latitude = position.latitude;
//   double longitude = position.longitude;
//
//   print('Latitude: $latitude, Longitude: $longitude');
// }