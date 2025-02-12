import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../core/utils/constanst/assetsPaths.dart';
import '../../core/utils/constanst/colors.dart';
import '../../core/utils/helper-functions/helper-functions.dart';
import '../authentication/ui/SignUpScreen.dart';
import '../shared-widgets/sharedWidgets.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      autoScrollDuration: 5000,
      initialPage: 0,
      onDone: () => Get.offAll(const SignUpScreen()),
      skip: Text(
        "Skip",
        style: TextStyle(
          fontFamily: interExtraBold,
          color: isLightMode(context)
              ? lightWidgetColorBackground
              : darkWidgetColorBackground,
        ),
      ),
      onSkip: () => Get.offAll(const SignUpScreen()),
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      next: ReusableWidgets().iconContainer(
          45, 45, Icons.arrow_forward_rounded, isLightMode(context)),
      done: Text(
        "Lets Go",
        style: TextStyle(
          fontFamily: interBold,
          color: isLightMode(context)
              ? lightWidgetColorBackground
              : darkWidgetColorBackground,
        ),
      ),
      dotsDecorator: DotsDecorator(
          activeColor: isLightMode(context)
              ? lightWidgetColorBackground
              : darkWidgetColorBackground,
          activeSize: const Size(30, 10),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
          size: const Size(10, 5)),
      pages: [
        PageViewModel(
            title: "",
            bodyWidget: ReusableWidgets().pageView(
                isLightMode(context),
                "Welcome to ",
                "High Fashion",
                "Discover Your Unique Style with our Exclusive Collections. Where fashion meets you.",
                ankaraImgPath,
                0)),
        PageViewModel(
            title: "",
            bodyWidget: ReusableWidgets().pageView(
                isLightMode(context),
                "Swift and Reliable ",
                "Delivery",
                "Your favorite fashion finds, delivered right to your door in no time.",
                ankaraImgPath,
                1)),
        PageViewModel(
            title: "",
            bodyWidget: ReusableWidgets().pageView(
                isLightMode(context),
                "Start Your Style ",
                "Journey",
                "Explore the Latest in High Fashion. From elegant to casual, find the perfect look for every occasion.",
                ankaraImgPath,
                2)),
      ],
    );

    //);
  }
}
