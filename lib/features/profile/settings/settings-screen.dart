import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../core/utils/constanst/assetsPaths.dart';
import '../../../core/utils/helper-functions/helper-functions.dart';
import '../../shared-widgets/sharedWidgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              CupertinoIcons.back,
              size: 30,
            )),
        title: const Text(
          "Settings",
          style: TextStyle(fontFamily: interBold, fontSize: 26),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ReusableWidgets().buildTextRow(
                  () {},
                  CupertinoIcons.info,
                  "Notification Settings",
                  CupertinoIcons.forward,
                  isLightMode(context)),
              ReusableWidgets().buildTextRow(
                  () {},
                  Iconsax.key_copy,
                  "Password Manager",
                  CupertinoIcons.forward,
                  isLightMode(context)),
              ReusableWidgets().buildTextRow(
                  () {},
                  Iconsax.profile_delete_copy,
                  "Delete Account",
                  CupertinoIcons.forward,
                  isLightMode(context)),
            ],
          ),
        ),
      ),
    );
  }
}
