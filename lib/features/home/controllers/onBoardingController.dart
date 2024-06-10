import 'dart:async';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreenController extends GetxController {
  static WelcomeScreenController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    _checkFirstLaunch();
  }

  Future<void> _checkFirstLaunch() async {
    await Future.delayed(const Duration(seconds: 6));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = prefs.getBool("isFirstLaunch") ?? true;

    if (isFirstLaunch) {
      await prefs.setBool("isFirstLaunch", false);
      Get.offAllNamed('/welcome');
    } else {
      Get.offAllNamed("/home");
    }
  }
}
