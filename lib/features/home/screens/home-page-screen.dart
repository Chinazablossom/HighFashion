import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/core/utils/constanst/assetsPaths.dart';
import 'package:high_fashion/core/utils/constanst/colors.dart';
import 'package:high_fashion/features/home/controllers/homeCardController.dart';
import 'package:high_fashion/features/search/search-screen.dart';
import 'package:high_fashion/features/shared-widgets/reuseableWidgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/utils/helper-functions/helper-functions.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final HomeCardController controller = Get.put(HomeCardController());
    final pages = List.generate(
        6,
            (index) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.shade300,
          ),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Container(
            height: 280,
            child: Center(
                child: Text(
                  "Page $index",
                  style: TextStyle(color: Colors.indigo),
                )),
          ),
        ));

    return ReuseableWidgets().buildAppScreenBackGround(headerImg:  headerBlack, bgTopPos: 180, bgLeftPos: 0, bgRightPos: 0, bgBottomPos: -0.1,
      child: ReuseableWidgets().buildBackgroundContainer(lightBackground, 40, 40, 0, 0,
          SafeArea(
              child: SingleChildScrollView(
            padding: EdgeInsets.only(
                left: isSmallScreen(context) ? 20 : 50,
                right: isSmallScreen(context) ? 16 : 50,
                top: isSmallScreen(context) ? 0 : 20,
                bottom: isSmallScreen(context) ? 0 : 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
/*

                PageView.builder(
                  itemBuilder: (_, index) {
                    return pages[index % pages.length];
                  },
                  controller: controller.pageController,
                  onPageChanged: controller.onPageChanged,

                ),
                Obx(() {
                  return Text(
                    'Current Page: ${controller.currentPage.value + 1}',
                    style: TextStyle(fontSize: 20),
                  );
                }),

                SmoothPageIndicator(
                  controller: controller.pageController,
                  count: pages.length,
                  effect: const WormEffect(
                    dotHeight: 16,
                    dotWidth: 16,
                    type: WormType.thinUnderground,
                  ),
                ),
*/
              Column(
                children: [
                  Text("Categories",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),
                  )
                ],
              )







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


        ],
      ),
    );
  }


  Widget _buildPage(String text, Color color) {
    return Container(
      height: 200,
      width: 200,
      color: color,
      child: Center(
        child: Text(text,
          style: const TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }



}
