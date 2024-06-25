import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:high_fashion/core/utils/constanst/assetsPaths.dart';
import 'package:high_fashion/features/home/controllers/count-down-controller.dart';
import 'package:high_fashion/features/search/search-screen.dart';
import 'package:high_fashion/features/shared-widgets/reuseableWidgets.dart';

import '../../../core/utils/helper-functions/helper-functions.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CountDownController countDownTimerController =
        Get.put(CountDownController());

    return ReuseableWidgets().buildAppScreenBackGround(
      headerImg: headerBlack,
      bgTopPos: 85,
      bgLeftPos: 0,
      bgRightPos: 0,
      bgBottomPos: -0.1,
      child: ReuseableWidgets().buildBackgroundContainer(
          Colors.white,
          40,
          40,
          0,
          0,
          SafeArea(
              child: SingleChildScrollView(
            padding: EdgeInsets.only(
                left: isSmallScreen(context) ? 16 : 50,
                right: isSmallScreen(context) ? 16 : 50,
                top: isSmallScreen(context) ? 0 : 20,
                bottom: isSmallScreen(context) ? 0 : 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TOP CAROUSEL NEW INS AD
                CarouselSlider(
                  options: CarouselOptions(
                    height: 150,
                    viewportFraction: 1,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 6),
                    enableInfiniteScroll: true,
                  ),
                  items: [0, 1, 2, 3].map((i) {
                    return carouselImg(
                      url: i == 0
                          ? newShoesCollectionImg
                          : i == 1
                              ? newSummerCollectionImg
                              : i == 2
                                  ? newWinterCollectionImg
                                  : i == 3
                                      ? newBeachCollectionImg
                                      : newSummerCollectionImg,
                      isNetworkImage: false,
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 12,
                ),

                // CATEGORIES LIST
                const Text(
                  "Categories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                            height: 100,
                            child: CategoriesList(
                              itemsList: catList,
                            ))),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),

                // FLASH SALE AND TIMER TO FLASH SALE
                Row(
                  children: [
                    Flexible(
                      child: Divider(
                        color: Colors.grey.withOpacity(0.5),
                        indent: 0,
                        endIndent: 0,
                      ),
                    ),
                  ],
                ),
                Obx(
                  () {
                    final time = countDownTimerController.remaingTime.value;
                    int days = time.inDays;
                    int hours = time.inHours;
                    int minutes = time.inMinutes;

                    return Row(
                      children: [
                        const Expanded(
                            child: Text(
                          "Flash Sale",
                          style: TextStyle(
                              color: Colors.black, fontFamily: interBold),
                        )),
                        const Text(
                          "Closing in:",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        buildCountTimer(days.toString().padLeft(2, "0"), 30),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text(":",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(
                          width: 4,
                        ),
                        buildCountTimer(hours.toString(), 30),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text(":",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(
                          width: 4,
                        ),
                        buildCountTimer(minutes.toString().padRight(2),
                            minutes.toString().length > 3 ? 50 : 30)
                      ],
                    );
                  },
                ),
                Row(
                  children: [
                    Flexible(
                      child: Divider(
                        color: Colors.grey.withOpacity(0.5),
                        indent: 0,
                        endIndent: 0,
                      ),
                    ),
                  ],
                ),
                const Text("New Arrivals",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: interBold)),
                SizedBox(
                  height: isSmallScreen(context) ? 10 : 16,
                ),

                // PRODUCT LIST
                GridView.custom(
                  gridDelegate: SliverStairedGridDelegate(
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 20,
                      tileBottomSpace: 80,
                      pattern: [
                        const StairedGridTile(0.5, 1),
                        const StairedGridTile(0.5, 1),
                      ]),
                  childrenDelegate: SliverChildBuilderDelegate(
                    childCount: 14,
                    addAutomaticKeepAlives: true,
                    (context, index) {
                      return const ProductItemCard(
                          imgPath: "assets/images/image 53.png",
                          price: 40.5,
                          productName: "Top you Shirt");
                    },
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                )
              ],
            ),
          ))),
      childOp: Column(
        children: [
          HAppBar(
            centerTilt: false,
            backArrowVisible: false,
            title: ReuseableWidgets().buildSearchBar(
                () => Get.to(() => const SearchScreen()), isLightMode(context)),
            actions: [
              ReuseableWidgets().buildStackNotificationIcon(
                  63, Icon(CupertinoIcons.chat_bubble_text_fill,color: Colors.white), () => null),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
        ],
      ),
    );
  }
}
