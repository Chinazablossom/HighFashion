import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:high_fashion/core/utils/constanst/assetsPaths.dart';
import 'package:high_fashion/core/utils/constanst/colors.dart';
import 'package:high_fashion/core/utils/helper-functions/helper-functions.dart';

import '../../../core/utils/constanst/texts.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
          "Privacy Policy",
          style: TextStyle(fontFamily: interExtraBold, fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Cancellation Policy",
                style: TextStyle(
                    fontFamily: interBlack,
                    color: isLightMode(context)
                        ? lightWidgetColorBackground
                        : darkWidgetColorBackground)),
            const SizedBox(
              height: 4,
            ),
            const Text(
                defaultShortText
            ),
            const SizedBox(
              height: 12,
            ),
            Text("Terms & Conditions",
                style: TextStyle(
                    fontFamily: interBlack,
                    color: isLightMode(context)
                        ? lightWidgetColorBackground
                        : darkWidgetColorBackground)),
            const SizedBox(
              height: 4,
            ),
            const Text(
                longDefaultText,
            ),
          ],
        ),
      ),
    );
  }
}
