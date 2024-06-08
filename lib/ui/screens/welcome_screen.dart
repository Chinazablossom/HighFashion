import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/ui/screens/onBoardingScreen.dart';
import 'package:high_fashion/ui/widgets/common.dart';
import 'package:high_fashion/utils/constanst/assetsPaths.dart';

import '../../utils/constanst/colors.dart';
import '../../utils/helper-functions/helper-functions.dart';

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
                        visible: isPortraitMode(context) ? false : true,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Column(
                            children: [
                              imgContainer(
                                  250, 200, 70,ankaraImgPath),
                              const SizedBox(
                                height: 16,
                              ),
                              imgContainer(
                                  180, 200,70,maxiSkirtImgPath),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                          flex: 1,
                          child: imgContainer(
                              350, 200, 70, classyLookImgPath )),
                      const SizedBox(
                        width: 16,
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            imgContainer(
                                230, 200,70, jewelryAndNailImgPath),
                            const SizedBox(
                              height: 16,
                            ),
                            imgContainer(
                                180, 180,70, corsetImgPath),
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
                            color:  isLightMode(context)
                                ?  Colors.black
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
                          )
                      ),
                    ])),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Elevate Your Wardrobe with Exclusive Designs.\nShop Now And Transform Your Looks!",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                largeBtn(isLightMode(context), "Lets Get Started",(){
                  Get.to(()=> const OnBoardingScreen());
                }),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      const Text(
                           "Already have an account?",
                          style: TextStyle(fontFamily: interSemiBold)),

                    const SizedBox(width: 6,),
                    GestureDetector(
                      onTap: () {},
                      child: Text("Login",
                          style: TextStyle(
                              color: isLightMode(context)
                                  ?  lightWidgetColorBackground
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
