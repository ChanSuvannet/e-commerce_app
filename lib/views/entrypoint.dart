import 'package:e_commerce/controllers/tab_index_controller.dart';
import 'package:e_commerce/views/cart/cart_page.dart';
import 'package:e_commerce/views/home/home_page.dart';
import 'package:e_commerce/views/profile/profile_page.dart';
import 'package:e_commerce/views/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> pageList = const [
    HomePage(),
    SearchPage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final TabIndexController controller = Get.put(TabIndexController());

    return Scaffold(
      body: Obx(() => pageList[controller.tabIndex]),
      bottomNavigationBar: Obx(
        () => Theme(
          data: Theme.of(context).copyWith(
            canvasColor: kPrimary,
          ),
          child: BottomNavigationBar(
            currentIndex: controller.tabIndex,
            onTap: controller.setTabIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedIconTheme: const IconThemeData(color: Colors.black38),
            selectedIconTheme: IconThemeData(color: kSecondary),
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  controller.tabIndex == 0
                      ? AntDesign.appstore1
                      : AntDesign.appstore_o,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  controller.tabIndex == 1
                      ? Icons.search
                      : Icons.search_outlined,
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Badge(
                  label: const Text('1'),
                  child: Icon(
                    controller.tabIndex == 2
                        ? Icons.shopping_cart
                        : Icons.shopping_cart_outlined,
                  ),
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  controller.tabIndex == 3
                      ? Icons.person
                      : Icons.person_outline,
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
