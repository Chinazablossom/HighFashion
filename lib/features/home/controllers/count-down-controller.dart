
import 'dart:async';

import 'package:get/get.dart';

class CountDownController extends GetxController{
  static CountDownController get instance => Get.find();

  late Timer _timer;
  var remaingTime = const Duration(days: 5,).obs;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer(){
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if(remaingTime.value.inSeconds > 0){
        remaingTime.value = remaingTime.value - const Duration(seconds: 1);
      }else {
        _timer.cancel();
      }
    });
  }

  void resetTimer(){
    remaingTime.value = const Duration(hours: 5);
    startTimer();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }




}