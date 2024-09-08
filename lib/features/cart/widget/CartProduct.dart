import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../core/models/product_model.dart';
import '../../../core/utils/constanst/colors.dart';
import '../../../core/utils/helper-functions/helper-functions.dart';
import '../../product/controllers/product-global-controllers.dart';
import '../../shared-widgets/sharedWidgets.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final GlobalController controller = GlobalController.instance;


    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                  color: isLightMode(context) ? Colors.black54 : Colors.white.withOpacity(0.3),
                  blurRadius: 2.0,
                  spreadRadius: 2,
                  blurStyle: BlurStyle.outer)
            ],
            color: isLightMode(context) ? Colors.white : Colors.black.withOpacity(0.4)),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(35)),
                    child: Container(
                      height: 145,
                      width: double.infinity,
                      color: colorList[Random().nextInt(29)],
                      child: FadeInImage(
                          fit: BoxFit.contain,
                          placeholder: MemoryImage(kTransparentImage),
                          image: AssetImage(product.image)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text("Size: XS"),
                        const SizedBox(
                          height: 6,
                        ),
                        Obx(() => Text(
                          "\$${controller.calculateTotalPrice(product).toStringAsFixed(2)}",
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Obx(
                  () => Positioned(
                right: 16,
                bottom: 16,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.decreaseQuantity(product);
                      },
                      child: Container(
                        height: 28,
                        width: 30,
                        decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(6)),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 6, right: 6),
                            child: Text(
                              "—",
                              style: TextStyle(fontWeight: FontWeight.w900, color: lightWidgetColorBackground),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text("${controller.getQuantity(product)}"),
                    const SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () {
                        controller.increaseQuantity(product);
                      },
                      child: Container(
                        height: 28,
                        width: 30,
                        decoration: BoxDecoration(
                            color: isLightMode(context) ? lightWidgetColorBackground : darkWidgetColorBackground,
                            borderRadius: BorderRadius.circular(6)),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 6, right: 6),
                            child: Text(
                              "+",
                              style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
