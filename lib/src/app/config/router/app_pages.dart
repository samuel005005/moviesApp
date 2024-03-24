import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviesapp/src/app/config/router/app_routes.dart';
import 'package:moviesapp/src/presentation/controllers/movies/movies_binding.dart';
import 'package:moviesapp/src/presentation/screens/movies/home_screen.dart';

class AppPages {
  static List<GetPage> list = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(
        pageIndex: 1,
      ),
      binding: MoviesBinding(),
    ),
    GetPage(
      name: '/home/:page',
      page: () => const HomeScreen(
        pageIndex: 0,
      ),
      middlewares: [
        RouteMiddleware(),
      ],
    ),
    // GetPage(
    //   name: '/home/:page/movie/:id',
    //   page: () => MovieScreen(),
    // ),
  ];
}

class RouteMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final params = Get.parameters;
    final pageIndex = int.parse(params['page'] ?? '0');
    if (pageIndex > 2 || pageIndex < 0) {
      return const RouteSettings(name: '/not-found');
    }
    return null;
  }
}
