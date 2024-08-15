import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/features/home/screens/nav_screen.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../core/utils/constanst/assetsPaths.dart';
import '../../../core/utils/constanst/colors.dart';
import '../../../core/utils/helper-functions/helper-functions.dart';
import '../../shared-widgets/sharedWidgets.dart';
import '../forgot_password/forgot-password-sheet.dart';
import 'SignUpScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            75,
            0,
            0,
            0,
            SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    left: isSmallScreen(context) ? 16 : 50,
                    right: isSmallScreen(context) ? 16 : 50,
                    bottom: isSmallScreen(context) ? 0 : 30),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontFamily: interExtraBold,
                          fontSize: 34,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        "Hi, Welcome back we've missed you!",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.sms_copy),
                          labelText: "Email",
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.key_copy),
                          suffixIcon: Icon(CupertinoIcons.eye_slash),
                          labelText: "Password",
                        ),
                        obscureText: true,
                      ),
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Row(
                              children: [
                                Checkbox(
                                  value: true,
                                  onChanged: (value) {},
                                ),
                                const Text("Remember me")
                              ],
                            ),
                          ),

                          /// FORGOT PASSWORD
                          TextButton(
                              onPressed: () {
                                ForgotPasswordBottomSheet()
                                    .buildShowModalBottomSheet(context);
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: isLightMode(context)
                                        ? lightWidgetColorBackground
                                        : darkWidgetColorBackground),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ReuseableWidgets().largeAppBtn("Login", () {
                        Get.to(() => const NavScreen(),
                            transition: Transition.native,
                            duration: const Duration(seconds: 1));
                      },
                          isLightMode(context)
                              ? lightWidgetColorBackground
                              : darkWidgetColorBackground,
                          Colors.white),
                      const SizedBox(
                        height: 35,
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
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: IconButton(
                              onPressed: () {
                                // TODO: GOOGLE LOGIN
                              },
                              icon: const Image(
                                  height: 55, image: AssetImage(googleIcon)),
                            ),
                          ),
                          Flexible(
                            child: IconButton(
                              onPressed: () {
                                // TODO: FACEBOOK LOGIN
                              },
                              icon: const Image(
                                  height: 55, image: AssetImage(faceBookIcon)),
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
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offAll(() => const SignUpScreen(),
                                  transition: Transition.native,
                                  duration: const Duration(seconds: 1));
                            },
                            child: Text("Sign Up",
                                style: TextStyle(
                                    color: isLightMode(context)
                                        ? lightWidgetColorBackground
                                        : darkWidgetColorBackground,
                                    fontFamily: interSemiBold,
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
          childOp: Container()),
    );
  }
}
