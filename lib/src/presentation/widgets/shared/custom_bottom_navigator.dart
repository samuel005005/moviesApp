import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonNavigator extends StatelessWidget {
  final int currentIndex;
  const CustomButtonNavigator({
    super.key,
    required this.currentIndex,
  });

  void onItemTapped(BuildContext context, int index) {
    Get.toNamed('/home/$index');
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: currentIndex,
      onTap: (value) => onItemTapped(context, value),
      items: const [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home_max),
        ),
        BottomNavigationBarItem(
          label: "Categories",
          icon: Icon(Icons.label_outline),
        ),
        BottomNavigationBarItem(
          label: "Favorites",
          icon: Icon(Icons.favorite_outline),
        ),
      ],
    );
  }
}
