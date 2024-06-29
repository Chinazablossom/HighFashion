import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/features/authentication/ui/loginScreen.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../core/utils/constanst/assetsPaths.dart';
import '../../../core/utils/constanst/colors.dart';
import '../../../core/utils/helper-functions/helper-functions.dart';
import '../../shared-widgets/sharedWidgets.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ReuseableWidgets().buildAppScreenBackGround(
      headerImg: headerColoredBlur,
      bgTopPos: 120,
      bgLeftPos: 0,
      bgRightPos: 0,
      bgBottomPos: 0,
      child: ReuseableWidgets().buildBackgroundContainer(
        lightBackground,
        75,
        0,
        0,
        0,
        SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
                left: isSmallScreen(context) ? 18 : 50,
                top: 25,
                right: isSmallScreen(context) ? 12 : 50),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user_copy),
                      labelText: "User name",
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.sms_copy),
                      labelText: "Email",
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.call_copy),
                      labelText: "Phone number",
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.key_copy),
                      suffixIcon: Icon(Iconsax.eye_slash),
                      labelText: "Password",
                    ),
                    obscureText: true,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (value) {},
                          ),
                          const Text("Agree with"),
                          const SizedBox(
                            width: 4,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Terms & Condition",
                              style: TextStyle(
                                  color: isLightMode(context)
                                      ? lightWidgetColorBackground
                                      : darkWidgetColorBackground,
                                  decoration: TextDecoration.underline,
                                  fontFamily: interSemiBold),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  ReuseableWidgets().largeAppBtn(
                    "Sign Up",
                    () {},isLightMode(context)
                      ? lightWidgetColorBackground
                      : darkWidgetColorBackground,Colors.white
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Divider(
                          color: Colors.grey.shade700,
                          indent: 50,
                          endIndent: 5,
                        ),
                      ),
                      Text(
                        "or login with",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Flexible(
                        child: Divider(
                          color: Colors.grey.shade700,
                          indent: 5,
                          endIndent: 55,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Image(
                              height: 50, image: AssetImage(googleIcon)),
                        ),
                      ),
                      Flexible(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Image(
                              height: 50, image: AssetImage(faceBookIcon)),
                        ),
                      ),
                      Flexible(
                        child: IconButton(
                          onPressed: () {
                            Get.snackbar("Apple Login", "Coming Soon...",
                                backgroundColor: isLightMode(context)
                                    ? Colors.white
                                    : Colors.white30,
                                duration: const Duration(seconds: 5));
                          },
                          icon: Image(
                            height: 50,
                            image: AssetImage(isLightMode(context)
                                ? appleIcon
                                : appleIconDark),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAll(() => const LoginScreen(),transition: Transition.native,duration: const Duration(seconds: 1 ));
                        },
                        child: Text("Login",
                            style: TextStyle(
                                color: isLightMode(context)
                                    ? lightWidgetColorBackground
                                    : darkWidgetColorBackground,
                                fontFamily: interBold,
                                decoration: TextDecoration.underline)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      childOp: Stack(children: [
        Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Create an account",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 26,
                      color:
                          isLightMode(context) ? Colors.white : Colors.black),
                ),
                Text(
                  "Start your shopping adventure with us now!",
                  style: TextStyle(
                      fontSize: 16,fontWeight: FontWeight.w500,
                      color:
                          isLightMode(context) ? Colors.white : Colors.black),
                ),
              ],
            )),
      ]),
    ));
  }
}
