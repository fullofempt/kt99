import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kt99/app/services/api_services.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
Future<void> initServices() async {
  await Get.putAsync(() => ApiServices().init());
}