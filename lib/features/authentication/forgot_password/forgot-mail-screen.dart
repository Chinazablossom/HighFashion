import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/features/authentication/verification/otp/otp-ui.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../core/utils/constanst/assetsPaths.dart';
import '../../../core/utils/helper-functions/helper-functions.dart';
import '../../shared-widgets/reuseableWidgets.dart';
import '../ui/loginScreen.dart';

class ForgotMailScreen extends StatelessWidget {
  const ForgotMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(headerDark), fit: BoxFit.cover)),
      ),
      Positioned(
          top: 25,
          left: 8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    Get.offAll(const LoginScreen());
                  },
                  icon: const Icon(
                    color: Colors.white,
                    Icons.arrow_back_ios,
                    size: 26,
                  )),
            ],
          )),
      Positioned(
          top: 120,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(lightBackgroundImg),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const Text("Reset Your Password",
                            style: TextStyle(
                                fontFamily: interBlack, fontSize: 32)),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                            "Enter your email address below to receive a One-Time Password to reset your password.",
                            style: TextStyle(
                                fontSize: 15, fontFamily: interRegular)),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.sms_copy)),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        ReuseableWidgets()
                            .largeAppBtn(isLightMode(context), "Next", () {
                          OTPBottomSheet()
                              .buildShowModalBottomSheet(context, "email");
                        })
                      ],
                    ),
                  ),
                ),
              )))
    ]));
  }
}
