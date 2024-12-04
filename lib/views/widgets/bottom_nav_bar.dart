import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/bottom_nav_controller.dart';

class BottomNavigationWidget extends StatelessWidget {
  final BottomNavController bottomNavController =
      Get.put(BottomNavController());

  BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: bottomNavController.selectedIndex.value,
        onTap: bottomNavController.changeTab,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: 'Subscription',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'My Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet_travel),
            label: 'Wallet',
          ),
        ],
      ),
    );
  }
}
