import 'package:flutter/material.dart';
import 'package:high_fashion/core/utils/constanst/colors.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../core/utils/helper-functions/helper-functions.dart';
import '../../shared-widgets/sharedWidgets.dart';

class CompleteYourProfile extends StatelessWidget {
  const CompleteYourProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: const BoxDecoration(
                        color: Colors.grey, shape: BoxShape.circle),
                    child: const Icon(
                      Iconsax.location,
                      size: 60,
                      color: lightWidgetColorBackground,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const Text(
                    "What's your location?",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "We need to know your location in order to suggest nearby services.",
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ReuseableWidgets().largeAppBtn(
                      "Allow Location Access",
                      () {},
                      isLightMode(context)
                          ? lightWidgetColorBackground
                          : darkWidgetColorBackground,
                      Colors.white),
                  const SizedBox(
                    height: 16,
                  ),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        textStyle: const MaterialStatePropertyAll(TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                        foregroundColor: MaterialStatePropertyAll(
                            isLightMode(context)
                                ? lightWidgetColorBackground
                                : darkWidgetColorBackground)),
                    child: const Text("Enter Location Manually"),
                  )
                ],
              ),
            )));
  }
}
