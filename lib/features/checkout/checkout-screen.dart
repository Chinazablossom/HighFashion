/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/constanst/assetsPaths.dart';
import '../profile/addresses/controllers/new-addresses-controller.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddressesController addressesController = Get.put(AddressesController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Text(
          "Checkout",
          style: TextStyle(fontFamily: interBold, fontSize: 22),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              CupertinoIcons.back,
              size: 30,
            )),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Shipping Address",style: TextStyle(fontWeight: FontWeight.w700),),
            SizedBox(height: 6,),
            Obx(() =>Text(addressesController.addressesList.first.address))
            





          ],
        ),
      ),
    );
  }
}
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/core/utils/constanst/colors.dart';
import 'package:high_fashion/core/utils/helper-functions/helper-functions.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../core/models/product_model.dart';
import '../../core/utils/constanst/assetsPaths.dart';
import '../cart/widget/CartProduct.dart';
import '../product/controllers/product-global-controllers.dart';
import '../profile/addresses/all-addrsses-screen.dart';
import '../profile/addresses/controllers/new-addresses-controller.dart';
import '../profile/addresses/widget/single-address-widget.dart';
import '../shared-widgets/sharedWidgets.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddressesController addressesController = Get.put(AddressesController());
    final GlobalController controller = GlobalController.instance;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Text(
          "Checkout",
          style: TextStyle(fontFamily: interBold, fontSize: 22),
        ),
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              CupertinoIcons.back,
              size: 30,
            )),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 14,top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Shipping to", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                padding: EdgeInsets.only(top: 13,right: 6),
                child: Icon(Iconsax.location_copy,size: 16,),
              ),
                Expanded(flex: 4, child: demoAddresses[0]),
                Expanded(
                  child: TextButton(onPressed: () {
                  Get.to(() => const AddressesScreen(),
                  transition: Transition.native,
                  duration: const Duration(seconds: 1));
                  }, child: Text("CHANGE",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 12,color: isLightMode(context) ? lightWidgetColorBackground : darkWidgetColorBackground),),),
                )
              ],
            ),
            SizedBox(height: 4,),
             const Text(
              "Order List",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            SizedBox(height: 4,),
            Row(
              children:[
                Flexible(
                child: Divider(
                  color: Colors.grey,
                  indent: 3,
                  endIndent: 15,
                ),
              ),
              ]
            ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SizedBox(
                height: 65,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        decoration: const InputDecoration(label: Text("Have a promo code? Apply here",style: TextStyle(fontSize: 15.5),)),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Expanded(
                        child: ReusableWidgets().largeAppBtn("Apply", () => null,
                            isLightMode(context) ? lightWidgetColorBackground : darkWidgetColorBackground,
                            Colors.white)
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 6,),
            Obx(() => SizedBox(
              height: controller.cart.length * 170,
              child: Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.cart.length,
                    itemBuilder: (context, index) {
                      Product product = controller.cart[index];
                      return CartProduct(product: product);
                    },
                  ),
              ),
              )),
            SizedBox(height: 8,),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(16))
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Payment"),
              ) ,
            ),

            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
