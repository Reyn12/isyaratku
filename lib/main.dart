import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  print('Application started');
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Isyaratku",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
