import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentIndex = 0.obs;

  void nextPage() {
    if (currentIndex < 2) {
      currentIndex++;
    }
  }

  void previousPage() {
    if (currentIndex > 0) {
      currentIndex--;
    }
  }

  void skipToLast() {
    currentIndex.value = 2;
  }
}
