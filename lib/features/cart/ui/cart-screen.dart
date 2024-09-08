import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/core/models/product_model.dart';
import 'package:high_fashion/core/utils/constanst/colors.dart';

import '../../../core/utils/constanst/assetsPaths.dart';
import '../../../core/utils/helper-functions/helper-functions.dart';
import '../../product/controllers/product-global-controllers.dart';
import '../../shared-widgets/sharedWidgets.dart';
import '../widget/CartProduct.dart';
import '../widget/ProductBottomSheet.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalController controller = GlobalController.instance;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "My Cart",
          style: TextStyle(fontFamily: interBold, fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Obx(() {
          if (controller.cart.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage(ghostAnimation)),
                  Text(
                    "Oh no so empty...",
                    style: TextStyle(fontFamily: interBold, fontSize: 18),
                  ),
                ],
              ),
            );
          }
          return Expanded(
            child: Stack(children: [
              ListView.builder(
                itemCount: controller.cart.length,
                itemBuilder: (context, index) {
                  Product product = controller.cart[index];
                  return Dismissible(
                      key: ValueKey(product.id),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        controller.removeFromCart(product);
                      },
                      background: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 20),
                        child: Container(
                            alignment: Alignment.centerRight,
                            decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.7), //const Color(0xffcb4a4a),
                                borderRadius: const BorderRadius.all(Radius.circular(16))),
                            child: const Padding(
                              padding: EdgeInsets.only(right: 16.0),
                              child: Icon(
                                CupertinoIcons.delete_solid,
                                size: 30,
                                color: darkWidgetColorBackground,
                              ),
                            )),
                      ),
                      child: CartProduct(product: product));
                },
              ),
              Positioned(
                bottom: 16,
                left: 12,
                right: 12,
                child: ReuseableWidgets().largeAppBtn("Checkout", () {
                  ProductBottomSheet().buildProductBottomSheet(context);
                }, isLightMode(context) ? lightWidgetColorBackground : darkWidgetColorBackground, Colors.white),
              )
            ]),
          );
        }),
      ),
    );
  }
}
