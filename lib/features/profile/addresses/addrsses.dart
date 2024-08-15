import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:high_fashion/core/utils/constanst/colors.dart';
import 'package:high_fashion/core/utils/helper-functions/helper-functions.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../core/utils/constanst/assetsPaths.dart';
import '../../chat/chat-screen.dart';
import '../../shared-widgets/sharedWidgets.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    () =>
                    Get.to(() => const ChatScreen(),
                        transition: Transition.rightToLeft,
                        duration: const Duration(seconds: 1)
                    )
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        // TODO ADD NEW ADDRESS
      },
        backgroundColor: isLightMode(context)
            ? lightWidgetColorBackground
            : darkWidgetColorBackground,
        child: Icon(Iconsax.add_circle_copy, color: Colors.white,),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SingleAddress(isSelected: true,),
            SingleAddress(isSelected: true,)
          ],
        ),

      ),
    );
  }
}

class SingleAddress extends StatelessWidget {
  const SingleAddress({
    super.key, required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16 ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color:
          isSelected ? isLightMode(context)
              ? lightWidgetColorBackground
              : Colors.white : Colors.grey, width: 2),
          color: isSelected
              ? lightWidgetColorBackground.withOpacity(0.5)
              : Colors.transparent,

      ),
      child: Stack(
        children: [
          Icon(
            isSelected ? Iconsax.tick_circle_copy : null,
            color: isSelected ? isLightMode(context) ? Colors.white : Colors.black :null,
          )
        ],
      ),
    ) ;
  }
}
