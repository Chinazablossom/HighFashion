import 'package:get/get.dart';
import 'package:high_fashion/ui/screens/chat-screen.dart';
import 'package:high_fashion/ui/screens/home-page-screen.dart';
import 'package:high_fashion/ui/screens/profile-screen.dart';
import 'package:high_fashion/ui/screens/wishlist-screen.dart';


class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = const [
    HomePageScreen(),
    WishListScreen(),
    ChatScreen(),
    ProfileScreen(),



  ];
}