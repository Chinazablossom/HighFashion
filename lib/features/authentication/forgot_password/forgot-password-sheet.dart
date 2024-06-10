import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../core/utils/constanst/assetsPaths.dart';
import '../../../core/utils/helper-functions/helper-functions.dart';
import '../../shared-widgets/reuseableWidgets.dart';
import 'forgot-mail-screen.dart';
import 'forgot-password-phone-screen.dart';

class ForgotPasswordBottomSheet {
  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Select a method",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          fontFamily: interExtraBold,
                          color: Colors.black)),
                  const Text("how do we send you the reset password OTP?",
                      style: TextStyle(color: Colors.black)),
                  const SizedBox(
                    height: 40,
                  ),
                  ReuseableWidgets()
                      .largeAppIconBtn(isLightMode(context), Iconsax.call, () {
                    Navigator.pop(context);
                    Get.to(() => const ForgotPhoneScreen());
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  ReuseableWidgets()
                      .largeAppIconBtn(isLightMode(context), Iconsax.sms, () {
                    Navigator.pop(context);
                    Get.to(() => const ForgotMailScreen());
                  })
                ],
              ),
            ));
  }
}
