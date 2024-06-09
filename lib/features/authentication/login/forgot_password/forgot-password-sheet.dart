
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/features/authentication/login/forgot_password/forgot-mail-screen.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../ui/widgets/reuseableWidgets.dart';
import '../../../../utils/constanst/assetsPaths.dart';
import '../../../../utils/helper-functions/helper-functions.dart';
import 'forgot-password-phone-screen.dart';

class ForgotPasswordBottomSheet{
  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(context: context, builder: (context) => Container(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Select a method",
              style: TextStyle(fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: interExtraBold,
                  color: isLightMode(context) ? Colors.white : Colors.black
              )),
          Text("how do we send you the reset password OTP?",
              style: TextStyle(
                  color: isLightMode(context) ? Colors.white : Colors.black
              )),
          const SizedBox(
            height: 40,
          ),
          ReuseableWidgets().largeAppIconBtn(isLightMode(context), Iconsax.call,
                  () {
                Navigator.pop(context);
                Get.to(() => const ForgotPhoneScreen());
              }
          ),
          const SizedBox(height: 30,),
          ReuseableWidgets().largeAppIconBtn(isLightMode(context), Iconsax.sms, () {
            Navigator.pop(context);
            Get.to(() => const ForgotMailScreen());
          }
          )


        ],
      ),
    ));
  }

}

