
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCardController extends GetxController{
  var currentPage = 0.obs;

  PageController pageController = PageController();

  void onPageChanged(int page) {
    currentPage.value = page;
  }

  void nextPage() {
    pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void previousPage() {
    pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }




}