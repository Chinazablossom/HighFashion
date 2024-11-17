import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/core/utils/helper-functions/helper-functions.dart';
import 'package:high_fashion/features/authentication/ui/privacy_policy.dart';
import 'package:high_fashion/features/chat/chat-screen.dart';
import 'package:high_fashion/features/profile/addresses/all-addrsses-screen.dart';
import 'package:high_fashion/features/profile/payment-methods/payment-screen.dart';
import 'package:high_fashion/features/profile/settings/settings-screen.dart';
import 'package:high_fashion/features/profile/user-profile/user-profile-screen.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../core/utils/constanst/assetsPaths.dart';
import '../shared-widgets/sharedWidgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Text(
          "Profile",
          style: TextStyle(fontFamily: interBold, fontSize: 26),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ReusableWidgets().buildStackNotificationIcon(
                63,
                const Icon(CupertinoIcons.chat_bubble_text_fill),
                () => Get.to(() => const ChatScreen(),
                    transition: Transition.rightToLeft,
                    duration: const Duration(seconds: 1))),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              //  PROFILE IMAGE
              const SizedBox(height: 150, width: 150, child: CircleAvatar()),
              const Text("User Name",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
              const SizedBox(
                height: 30,
              ),
              ReusableWidgets().buildTextRow(() {
                Get.to(() => const UserProfileScreen(),
                    transition: Transition.native,
                    duration: const Duration(seconds: 1));
              }, CupertinoIcons.person, "Your Profile", CupertinoIcons.forward,
                  isLightMode(context)),
              ReusableWidgets().buildTextRow(() {
                Get.to(() => const PaymentMethodScreen(),
                    transition: Transition.native,
                    duration: const Duration(seconds: 1));
              }, CupertinoIcons.creditcard, "Payment Method",
                  CupertinoIcons.forward, isLightMode(context)),
              ReusableWidgets().buildTextRow(() {
                // TODO: ADD ORDERS SCREEN

              }, Iconsax.clipboard_copy,
                  "My Orders", CupertinoIcons.forward, isLightMode(context)),
              ReusableWidgets().buildTextRow(() {
                Get.to(() => const AddressesScreen(),
                    transition: Transition.native,
                    duration: const Duration(seconds: 1));
              }, Iconsax.truck_copy, "Shipping Addresses",
                  CupertinoIcons.forward, isLightMode(context)),
              ReusableWidgets().buildTextRow(() {
                Get.to(() => const SettingsScreen(),
                    transition: Transition.native,
                    duration: const Duration(seconds: 1));
              }, Iconsax.setting_2_copy, "Settings", CupertinoIcons.forward,
                  isLightMode(context)),
              ReusableWidgets().buildTextRow(
                  () {
                    // TODO: ADD HELP CENTER SCREEN
                  },
                  Iconsax.message_question_copy,
                  "Help Center",
                  CupertinoIcons.forward,
                  isLightMode(context)),
              ReusableWidgets().buildTextRow(() {
                Get.to(() => const PrivacyPolicyScreen(),
                    transition: Transition.native,
                    duration: const Duration(seconds: 1));
              }, CupertinoIcons.lock_shield, "Privacy Policy",
                  CupertinoIcons.forward, isLightMode(context)),
              ReusableWidgets().buildTextRow(
                  () {
                    // TODO: SHARE APP
                  },
                  CupertinoIcons.share,
                  "Invite Friends",
                  CupertinoIcons.forward,
                  isLightMode(context)),
              ReusableWidgets().buildTextRow(() {
                // TODO: LOG USER OUT
              }, Iconsax.logout_copy,
                  "Log Out", CupertinoIcons.forward, isLightMode(context)),
            ],
          ),
        ),
      ),
    );
  }
}
