import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/constanst/colors.dart';
import '../../../core/utils/helper-functions/helper-functions.dart';
import '../../checkout/checkout-screen.dart';
import '../../shared-widgets/sharedWidgets.dart';

class ProductBottomSheet {
  Future<dynamic> buildProductBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Container(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        decoration: const InputDecoration(hintText: "Have a promo code? Apply here"),

                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                        child: ReuseableWidgets().largeAppBtn("Apply", () => null,
                            isLightMode(context) ? lightWidgetColorBackground : darkWidgetColorBackground,
                            Colors.white)
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(flex: 3 , child: Text("Sub-Total")),
                  Text("\$199.00",style: TextStyle(fontWeight: FontWeight.w600),)
                ],
              ),
              const SizedBox(height: 12,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(flex: 3 , child: Text("Shipping fee")),
                  Text("\$199.00",style: TextStyle(fontWeight: FontWeight.w600),)
                ],
              ),
              const SizedBox(height: 12,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(flex: 3 , child: Text("Discount")),
                  Text("-\$19.00",style: TextStyle(fontWeight: FontWeight.w600),)
                ],
              ),
              const SizedBox(height: 25,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(flex: 3 , child: Text("Total cost")),
                  Text("\$319.00",style: TextStyle(fontWeight: FontWeight.w600),)
                ],
              ),
              const SizedBox(height: 50,),
              ReuseableWidgets().largeAppBtn("Proceed To Checkout", () {
                Get.to(() => const CheckOutScreen(),
                    transition: Transition.native,
                    duration: const Duration(seconds: 1));
              },
                  isLightMode(context) ? lightWidgetColorBackground : darkWidgetColorBackground,
                  Colors.white)


            ],
          ),
        ));
  }
}