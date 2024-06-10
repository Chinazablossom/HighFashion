import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
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
        () => GNav(
            backgroundColor: isLightMode(context)
                ? lightWidgetColorBackground
                : darkWidgetColorBackground,
            color: Colors.grey.withOpacity(0.5),
            activeColor: Colors.white,
            tabBackgroundColor: Colors.white.withOpacity(0.1),
            gap: 8,
            iconSize: 20,
            haptic: true,
            curve: Curves.bounceIn,
            selectedIndex: controller.selectedIndex.value,
            onTabChange: (index) => controller.selectedIndex.value = index,
            tabs: const [
              GButton(icon: Iconsax.home, text: "Home Page"),
              GButton(
                icon: CupertinoIcons.heart_fill,
                text: "Wishlist",
              ),
              GButton(
                icon: CupertinoIcons.shopping_cart,
                text: "Cart",
              ),
              GButton(
                icon: CupertinoIcons.person_fill,
                text: "Profile",
              ),
            ]),
      ),
      body: SingleChildScrollView(
          child: Obx(() => controller.screens[controller.selectedIndex.value])),
    );
  }
}
