import 'package:get/get.dart';

import '../../chat/chat-screen.dart';
import '../../profile/profile-screen.dart';
import '../../wishlist/wishlist-screen.dart';
import '../screens/home-page-screen.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = const [
    HomePageScreen(),
    WishListScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];
}
