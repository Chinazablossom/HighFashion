import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/core/utils/constanst/colors.dart';
import 'package:high_fashion/features/authentication/verification/otp/otp-ui.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../core/utils/constanst/assetsPaths.dart';
import '../../../core/utils/helper-functions/helper-functions.dart';
import '../../shared-widgets/sharedWidgets.dart';
import '../ui/loginScreen.dart';

class ForgotPhoneScreen extends StatelessWidget {
  const ForgotPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ReuseableWidgets().buildAppScreenBackGround(
            headerImg: header,
            bgTopPos: 120,
            bgLeftPos: 0,
            bgRightPos: 0,
            bgBottomPos: 0,
            child: ReuseableWidgets().buildBackgroundContainer(
                isLightMode(context) ? lightBackground : darkBackground,
                70,
                0,
                0,
                0,
                SafeArea(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        left: isSmallScreen(context) ? 20 : 50,
                        right: isSmallScreen(context) ? 16 : 50,
                        top: isSmallScreen(context) ? 30 : 20,
                        bottom: isSmallScreen(context) ? 0 : 30),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Reset Your Password",
                              style: TextStyle(
                                  fontFamily: interBlack, fontSize: 32)),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text(
                              "Enter your Phone number below to receive a One-Time Password to reset your password.",
                              style: TextStyle(
                                  fontSize: 15, fontFamily: interRegular)),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.call_copy)),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          ReuseableWidgets()
                              .largeAppBtn("Next", () {OTPBottomSheet()
                                .buildShowModalBottomSheet(context, "phone");
                          },isLightMode(context)
                              ? lightWidgetColorBackground
                              : darkWidgetColorBackground,Colors.white
                          )
                        ],
                      ),
                    ),
                  ),
                )),
            childOp: Stack(
              children: [
                Positioned(
                    top: 25,
                    left: 8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.offAll(const LoginScreen(),transition: Transition.leftToRightWithFade,duration: const Duration(seconds: 1 ));
                            },
                            icon: const Icon(
                              color: Colors.white,
                              CupertinoIcons.back,
                              size: 30,
                            )),
                      ],
                    )),
              ],
            )));
  }
}

