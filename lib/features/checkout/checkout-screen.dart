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
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../core/utils/constanst/assetsPaths.dart';
import '../product/controllers/product-global-controllers.dart';
import '../profile/addresses/controllers/new-addresses-controller.dart';
import '../profile/addresses/widget/single-address-widget.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddressesController addressesController = Get.put(AddressesController());
    final GlobalController controller = GlobalController.instance;
    SingleAddress address = demoAddresses[0];
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
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Padding(
                padding: const EdgeInsets.only(top: 8.0,right: 12),
                child: const Icon(Iconsax.location_copy),
              ), Expanded(flex: 2, child: demoAddresses[0])],
            )
          ],
        ),
      ),
    );
  }
}
