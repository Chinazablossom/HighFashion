import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product-detail-controller.dart';

class SizesChoicesChip extends StatelessWidget {
  const SizesChoicesChip({
    super.key, required this.label, required this.toolTip, required this.index,
  });

  final String label;
  final String toolTip;
  final int index;


  @override
  Widget build(BuildContext context) {
    final ProductDetailController productDetailController = Get.put(ProductDetailController());

    return Obx(
          () =>  ChoiceChip(label: Text(label), selected: productDetailController.selectedSize.value == label,
        labelStyle: TextStyle(fontSize: 18,color: productDetailController.selectedSize.value == label ? Colors.white : null ),
        onSelected: (size){
          productDetailController.selectedSize.value = label;
        }, tooltip: toolTip,
      ),
    );
  }
}