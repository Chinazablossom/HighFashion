import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/features/authentication/login/forgot_password/forgot-password-sheet.dart';
import 'package:high_fashion/features/authentication/signUp/SignUpScreen.dart';
import 'package:high_fashion/ui/widgets/reuseableWidgets.dart';
import 'package:high_fashion/utils/constanst/assetsPaths.dart';
import 'package:high_fashion/utils/constanst/colors.dart';
import 'package:high_fashion/utils/helper-functions/helper-functions.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
          top: 120,
          left: 0,
          right: isPortraitMode(context) ? 0 : -270,
          bottom: 0,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(lightBackgroundImg),
                // Replace 'backgroundImg' with the actual path
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
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
                      const SizedBox(height: 4,),
                      const Text(
                        "Hi, Welcome back we've missed you!",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 30,),
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.sms_copy),
                          labelText: "Email",
                        ),
                      ),
                      const SizedBox(height: 16,),
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
                      ReuseableWidgets().largeAppBtn(
                        isLightMode(context),
                        "Login",
                        () {},
                      ),
                      const SizedBox(height: 35,),
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
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: IconButton(
                              onPressed: () {},
                              icon: const Image(
                                  height: 55, image: AssetImage(googleIcon)),
                            ),
                          ),
                          Flexible(
                            child: IconButton(
                              onPressed: () {},
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
                              Get.offAll(() => const SignUpScreen());
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
        ),
      ]),
    );
  }

}
