import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/features/authentication/ui/loginScreen.dart';

import '../../core/utils/constanst/assetsPaths.dart';
import '../../core/utils/constanst/colors.dart';
import '../../core/utils/helper-functions/helper-functions.dart';
import '../shared-widgets/sharedWidgets.dart';
import 'onBoardingScreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  Get.put(WelcomeScreenController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: isSmallScreen(context) ? false : true,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Column(
                            children: [
                              ReusableWidgets()
                                  .imgContainer(250, 200, 70, ankaraImgPath),
                              const SizedBox(
                                height: 16,
                              ),
                              ReusableWidgets()
                                  .imgContainer(180, 200, 70, maxiSkirtImgPath),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                          flex: 1,
                          child: ReusableWidgets()
                              .imgContainer(350, 200, 70, classyLookImgPath)),
                      const SizedBox(
                        width: 16,
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            ReusableWidgets().imgContainer(
                                230, 200, 70, jewelryAndNailImgPath),
                            const SizedBox(
                              height: 16,
                            ),
                            ReusableWidgets()
                                .imgContainer(180, 180, 70, corsetImgPath),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text:
                              "Embrace Elegance Discover The Latest Trends In ",
                          style: TextStyle(
                            color: isLightMode(context)
                                ? Colors.black
                                : Colors.white,
                            fontFamily: interBold,
                            fontSize: 22,
                          )),
                      TextSpan(
                          text: "High Fashion!",
                          style: TextStyle(
                            fontFamily: interExtraBold,
                            color: isLightMode(context)
                                ? lightWidgetColorBackground
                                : darkWidgetColorBackground,
                            fontSize: 22,
                          )),
                    ])),
                const SizedBox(
                  height: 18,
                ),
                const Text(
                  "Elevate Your Wardrobe with Exclusive Designs.\nShop Now And Transform Your Looks!",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 16,
                ),
                ReusableWidgets()
                    .largeAppBtn("Lets Get Started", () {
                  Get.to(() => const OnBoardingScreen(),
                      transition: Transition.circularReveal);
                },isLightMode(context)
                    ? Colors.black
                    : Colors.white,isLightMode(context)
                    ? Colors.white
                    : Colors.black,),
                const SizedBox(
                  height: 17,
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
                        Get.offAll(() => const LoginScreen(),
                            transition: Transition.circularReveal);
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
