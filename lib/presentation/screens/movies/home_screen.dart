import 'package:flutter/material.dart';
import 'package:moviesapp/presentation/views/views.dart';

import 'package:moviesapp/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  final int pageIndex;

  const HomeScreen({
    super.key,
    required this.pageIndex,
  });

  final viewRoutes = const <Widget>[
    HomeView(),
    SizedBox(),
    FavoriteView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomButtonNavigator(currentIndex: pageIndex),
    );
  }
}
