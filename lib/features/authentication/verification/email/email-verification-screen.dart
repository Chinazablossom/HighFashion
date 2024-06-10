import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/features/authentication/ui/loginScreen.dart';

import '../../../../core/utils/constanst/assetsPaths.dart';
import '../../../../core/utils/constanst/colors.dart';
import '../../../../core/utils/helper-functions/helper-functions.dart';
import '../../../shared-widgets/reuseableWidgets.dart';
import 'email-successful-screen.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.offAll(const LoginScreen(), transition: Transition.fadeIn);
            },
            icon: const Icon(
              Icons.clear,
              size: 32,
            )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(image: AssetImage(emailSentAnimation)),
              const SizedBox(
                height: 70,
              ),
              const Text(
                "Verify Your Email address!",
                style: TextStyle(
                  fontSize: 26,
                  fontFamily: interBold,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              const Text(
                "We sent a verification link to \$useremail, Check your email and click on the link to verify your email address",
                style: TextStyle(fontSize: 16, fontFamily: interRegular),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),

              ReuseableWidgets().largeAppBtn(isLightMode(context), "Continue",
                  () {
                /// if successful verify user
                EmailSuccessSheet().buildShowModalBottomSheet(context);
              }),

              const SizedBox(
                height: 18,
              ),

              //   RESEND VERIFICATION LINK BTN
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Resend Verification Link",
                  style: TextStyle(
                      color: blueColor,
                      fontSize: 18,
                      fontFamily: interSemiBold),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
