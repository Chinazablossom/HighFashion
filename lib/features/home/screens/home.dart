import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/core/utils/constanst/assetsPaths.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../core/utils/constanst/colors.dart';
import '../../../core/utils/helper-functions/helper-functions.dart';
import '../controllers/navigation-controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
            backgroundColor: Colors.white,
            color: Colors.black,
            buttonBackgroundColor: lightWidgetColorBackground,
            animationCurve: Curves.easeIn,
            animationDuration: const Duration(milliseconds: 350),
            index: controller.selectedIndex.value,
            onTap: (index) => controller.selectedIndex.value = index,
            items: const [
              Icon(Iconsax.home, color: Colors.white ),
              Icon(CupertinoIcons.search, color:  Colors.white ),
              Icon(Iconsax.shopping_cart, color: Colors.white),
              Icon(CupertinoIcons.person_fill, color: Colors.white ),
            ]),
      ),
      body: Scaffold(
        body: Obx(() => controller.screens[controller.selectedIndex.value]),
      ),
    );
  }
}
