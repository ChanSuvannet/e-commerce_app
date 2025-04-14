
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../controllers/tab_index_controller.dart';
import 'cart/cart_page.dart';
import 'favorite/favorite_page.dart';
import 'home/home_page.dart';
import 'profile/profile_page.dart';
import 'search/search_page.dart';
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> pageList = const [
    HomePage(),
    SearchPage(),
    FavoritePage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final TabIndexController controller = Get.put(TabIndexController());

    return Scaffold(
      extendBody: true,
      body: Obx(() => pageList[controller.tabIndex]),
      bottomNavigationBar: Obx(
        () => Container(
          // margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          // padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 20,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            backgroundColor: kPrimary,
            currentIndex: controller.tabIndex,
            onTap: controller.setTabIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: kSecondary,
            unselectedItemColor: Colors.black38,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Icon(controller.tabIndex == 0
                      ? AntDesign.appstore1
                      : AntDesign.appstore_o),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Icon(controller.tabIndex == 1
                      ? Icons.search
                      : Icons.search_outlined),
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Icon(controller.tabIndex == 2
                      ? Icons.favorite
                      : Icons.favorite_outline),
                ),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Badge(
                    label: const Text('1'),
                    child: Icon(controller.tabIndex == 3
                        ? Icons.shopping_cart
                        : Icons.shopping_cart_outlined),
                  ),
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Icon(controller.tabIndex == 4
                      ? Icons.person
                      : Icons.person_outline),
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
