import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../core/utils/constanst/assetsPaths.dart';
import '../../../core/utils/helper-functions/helper-functions.dart';
import '../../chat/chat-screen.dart';
import '../../shared-widgets/sharedWidgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HAppBar(
        centerTiltle: false,
        automaticallyImplyLeading: true,
        title: Text(
          "Settings",
          style: TextStyle(fontFamily: interBold, fontSize: 26),
        ),
        backArrowVisible: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ReuseableWidgets().buildTextRow((){},CupertinoIcons.info,"Notification Settings",CupertinoIcons.forward,isLightMode(context)),
              ReuseableWidgets().buildTextRow((){},Iconsax.key_copy,"Password Manager",CupertinoIcons.forward,isLightMode(context)),
              ReuseableWidgets().buildTextRow((){},Iconsax.profile_delete_copy,"Delete Account",CupertinoIcons.forward,isLightMode(context)),
            ],
          ),
        ),
      ),
    );
  }
}
