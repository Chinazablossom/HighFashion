import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/core/utils/constanst/assetsPaths.dart';
import 'package:high_fashion/core/utils/constanst/colors.dart';
import 'package:high_fashion/features/search/search-screen.dart';
import 'package:high_fashion/features/shared-widgets/reuseableWidgets.dart';

import '../../../core/utils/helper-functions/helper-functions.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ReuseableWidgets().buildAppScreenBackGround(
      headerImg: headerBlack,
      bgTopPos: 180,
      bgLeftPos: 0,
      bgRightPos: 0,
      bgBottomPos: -0.1,
      child: ReuseableWidgets().buildBackgroundContainer(
          lightBackground,
          40,
          40,
          0,
          0,
          SafeArea(
              child: SingleChildScrollView(
            padding: EdgeInsets.only(
                left: isSmallScreen(context) ? 20 : 50,
                right: isSmallScreen(context) ? 16 : 50,
                top: isSmallScreen(context) ? 30 : 20,
                bottom: isSmallScreen(context) ? 0 : 30),
            child: Column(
              children: [
                Text(
                  "Welcome back!",
                  style: TextStyle(fontFamily: interRegular, fontSize: 16),
                ),

                Text(
                  "Chinaza Blossom",
                  style: TextStyle(fontFamily: interSemiBold, fontSize: 18),
                ),
              ],
            ),
          ))),
      childOp: Column(
        children: [
          HAppBar(
            backArrowVisible: false,
            leading: const CircleAvatar(
                radius: 90, foregroundImage: AssetImage(classyLookImgPath)),
            title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome back!",
                  style: TextStyle(
                      fontFamily: interRegular, color: Colors.white, fontSize: 16),
                ),
                Text(
                  "Chinaza Blossom",
                  style: TextStyle(
                      fontFamily: interSemiBold, color: Colors.white, fontSize: 18),
                ),
              ],
            ),
            actions: [
             ReuseableWidgets().buildStackNotificationIcon(63, CupertinoIcons.chat_bubble_text_fill, () => null),
            ],
          ),
          const SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.only(left: 26,right: 26),
            child: ReuseableWidgets().buildSearchBar(() => Get.to(() => const SearchScreen())
            ),
          ),
    /*Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white38,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white)
              ),
            ),*/




        ],
      ),
    );
  }




}
