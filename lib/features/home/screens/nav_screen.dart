import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/core/utils/constanst/assetsPaths.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../core/utils/constanst/colors.dart';
import '../../../core/utils/helper-functions/helper-functions.dart';
import '../controllers/navigation-controller.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
            backgroundColor: isLightMode(context) ? Colors.white : darkBackground,
            color: isLightMode(context) ? Colors.black : Colors.white,
            buttonBackgroundColor: isLightMode(context) ? lightWidgetColorBackground : darkWidgetColorBackground,
            animationCurve: Curves.easeIn,
            animationDuration: const Duration(milliseconds: 350),
            index: controller.selectedIndex.value,
            onTap: (index) => controller.selectedIndex.value = index,
            height: 50,
            items:  [
              Icon(Iconsax.home, color:  isLightMode(context) ? Colors.white : Colors.black),
              Icon(CupertinoIcons.search, color:   isLightMode(context) ? Colors.white : Colors.black),
              Icon(Iconsax.shopping_cart, color:  isLightMode(context) ? Colors.white : Colors.black),
              Icon(CupertinoIcons.person_fill, color:  isLightMode(context) ? Colors.white : Colors.black ),
            ]),
      ),
      body: Scaffold(
        body: Obx(() => controller.screens[controller.selectedIndex.value]),
      ),
    );
  }
}
