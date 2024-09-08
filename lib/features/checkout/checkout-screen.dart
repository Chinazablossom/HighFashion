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

import '../../core/utils/constanst/assetsPaths.dart';
import '../product/controllers/product-global-controllers.dart';
import '../profile/addresses/controllers/new-addresses-controller.dart';

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
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              CupertinoIcons.back,
              size: 30,
            )),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shipping Address Section
            const Text(
              "Shipping Address",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}
