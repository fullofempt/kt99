import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kt99/app/services/network_services.dart';

import 'app/routes/app_pages.dart';

void main() async{
  await initServices();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
Future<void> initServices() async {
  await Get.putAsync(() async => NetworkServices().init());
}