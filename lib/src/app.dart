import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviesapp/src/app/config/router/app_pages.dart';
import 'package:moviesapp/src/app/config/router/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      getPages: AppPages.list,
      title: 'Material App',
    );
  }
}
