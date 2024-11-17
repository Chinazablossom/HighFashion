
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../core/utils/constanst/assetsPaths.dart';
import '../../../core/utils/constanst/colors.dart';
import '../../../core/utils/helper-functions/helper-functions.dart';
import '../../shared-widgets/sharedWidgets.dart';
import '../ui/loginScreen.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ReusableWidgets().buildAppScreenBackGround(
            headerImg: header,
            bgTopPos: 120,
            bgLeftPos: 0,
            bgRightPos: 0,
            bgBottomPos: 0,
            child: ReusableWidgets().buildBackgroundContainer(
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
                              "Your new password must be different from your previously used passwords.",
                              style: TextStyle(
                                  fontSize: 15, fontFamily: interRegular,color: Colors.grey)),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                suffixIcon: Icon(Iconsax.eye_slash_copy),
                            labelText: "New Password"
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.eye_slash_copy),
                                labelText: "Repeat Password"
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          ReusableWidgets()
                              .largeAppBtn("Create New Password", () {

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
