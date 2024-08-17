import 'package:get/get.dart';
import 'package:high_fashion/features/cart/ui/cart-screen.dart';
import 'package:high_fashion/features/search/search-screen.dart';

import '../../profile/profile-screen.dart';
import '../screens/home-page-screen.dart';

class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();

  final Rx<int> selectedIndex = 0.obs;

  final screens = const [
    HomePageScreen(),
    SearchScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
}
