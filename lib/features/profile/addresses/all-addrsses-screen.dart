import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/core/utils/constanst/colors.dart';
import 'package:high_fashion/core/utils/helper-functions/helper-functions.dart';
import 'package:high_fashion/features/profile/addresses/add-new-address.dart';
import 'package:high_fashion/features/profile/addresses/controllers/new-addresses-controller.dart';
import 'package:high_fashion/features/profile/addresses/widget/single-address-widget.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../core/utils/constanst/assetsPaths.dart';
import '../../chat/chat-screen.dart';
import '../../shared-widgets/sharedWidgets.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddressesController addressesController = Get.put(AddressesController());
    addressesController.addressesList.addAll(demoAddresses);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Text(
          "Shipping Addresses",
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ReuseableWidgets().buildStackNotificationIcon(
                63,
                const Icon(CupertinoIcons.chat_bubble_text_fill),
                    () => Get.to(() => const ChatScreen(),
                    transition: Transition.rightToLeft,
                    duration: const Duration(seconds: 1))),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (addressesController.addressesList.isEmpty) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage(ghostAnimation)),
                      Text(
                        "Oh no, so empty...",
                        style: TextStyle(fontFamily: interBold, fontSize: 18),
                      ),
                    ],
                  ),
                );
              } else {
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: addressesController.addressesList.length,
                  itemBuilder: (context, index) {
                    final address = addressesController.addressesList[index];
                    return Dismissible(
                      key: ValueKey(address),
                      direction: DismissDirection.horizontal,
                      onDismissed: (direction) {
                        addressesController.addressesList.removeAt(index);
                      },
                      background: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color(0x88ff1a1a),
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Iconsax.bag_cross_1_copy,
                          size: 40,
                          color: isLightMode(context) ? Colors.black : Colors.white,
                        ),
                      ),
                      child: SingleAddress(
                        isSelected: address.isSelected,
                        userName: address.userName,
                        phoneNumber: address.phoneNumber,
                        address: address.address,
                      ),
                    );
                  },
                );
              }
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30,left: 16,right: 16,top: 16),
            child: GestureDetector(
              onTap: () {
                Get.to(() => const AddNewAddressesScreen(),
                    transition: Transition.native,
                    duration: const Duration(seconds: 1));
              },
              child: Container(
                width: double.infinity,
                height: 65,
                decoration: BoxDecoration(
                  color: isLightMode(context)? Colors.grey.withOpacity(0.2): Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  strokeCap: StrokeCap.round,color: isLightMode(context) ? lightWidgetColorBackground : Colors.white,
                  radius: const Radius.circular(8),
                  dashPattern: const [8, 5],
                  strokeWidth: 2,
                  child: Center(
                    child: Text(
                      "+ Add New Shipping Address",
                      style: TextStyle(
                        color: isLightMode(context)
                            ? lightWidgetColorBackground
                            : darkWidgetColorBackground,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

