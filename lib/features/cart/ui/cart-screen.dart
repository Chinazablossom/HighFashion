import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/core/models/product_model.dart';
import 'package:high_fashion/core/utils/constanst/colors.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../core/utils/constanst/assetsPaths.dart';
import '../../../core/utils/helper-functions/helper-functions.dart';
import '../../product/controllers/product-global-controllers.dart';
import '../../shared-widgets/sharedWidgets.dart';

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
          return ListView.builder(
            itemCount: controller.cart.length,
            itemBuilder: (context, index) {
              Product product = controller.cart[index];
            return Dismissible(key: ValueKey(product.id),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    controller.removeFromCart(product);
                  },
                  background: Container(
                      alignment: Alignment.centerRight,
                      color: const Color(0xffcb4a4a),
                      height: 40,
                      width: 50,
                      child: const Icon(
                        Iconsax.shop_remove_copy,
                        size: 30,
                        color: Colors.white,
                      )),
                  child:  CartProduct(product: product) );


            //  return CartProduct(product: product);
            },
          );
        }),
      ),
    );
  }
}

class CartProduct extends StatelessWidget {
  const CartProduct({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
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
                    color: colorList[Random().nextInt(30)],
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
                      Text(
                        "\$${product.price}",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
            Positioned(
              right: 16,
              bottom: 16,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 28,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(6)),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 6, right: 6),
                          child: Text(
                            "—",
                            style:
                            TextStyle(fontWeight: FontWeight.w900, color: lightWidgetColorBackground),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text("5"),
                  const SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 28,
                      width: 30,
                      decoration: BoxDecoration(
                          color:
                          isLightMode(context) ? lightWidgetColorBackground : darkWidgetColorBackground,
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
          ],
        ),
      ),
    );
  }
}
