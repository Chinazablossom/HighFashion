import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared-widgets/sharedWidgets.dart';
import '../controllers/product-detail-controller.dart';

class ColorChoicesChip extends StatelessWidget {
  const ColorChoicesChip({super.key,});

  @override
  Widget build(BuildContext context) {
    final ProductDetailController productDetailController = Get.put(ProductDetailController());
    final index = Random().nextInt(29);

    return Obx(
          () => ChoiceChip(
            selected: productDetailController.selectedColor.value == colorNames[index],
        labelStyle: TextStyle(fontSize: 18,color: productDetailController.selectedColor.value == colorNames[index] ? Colors.white : null ),
        onSelected: (isSelected){
          if (isSelected) {
            productDetailController.selectedColor.value = colorNames[index];
          } else {
            productDetailController.selectedColor.value = "";
          }
        },
        selectedColor: colorList[index] ,
        backgroundColor:colorList[index]  ,
        shape: const CircleBorder(),
        labelPadding: const EdgeInsets.all(0), label: const Text("") ,



      ),
    );
  }
}
