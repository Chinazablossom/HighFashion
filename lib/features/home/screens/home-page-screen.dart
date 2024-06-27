import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:high_fashion/core/models/product_model.dart';
import 'package:high_fashion/core/utils/constanst/assetsPaths.dart';
import 'package:high_fashion/features/home/controllers/count-down-controller.dart';
import 'package:high_fashion/features/shared-widgets/sharedWidgets.dart';
import 'package:high_fashion/features/wishlist/wishlist-screen.dart';

import '../../../core/utils/helper-functions/helper-functions.dart';
import '../../search/search-screen.dart';
import '../../wishlist/controller/wishlist_controller.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CountDownController countDownTimerController = Get.put(CountDownController());
    final FavoritesController favoritesController = Get.put(FavoritesController());


    return ReuseableWidgets().buildAppScreenBackGround(
      headerImg: isLightMode(context) ? headerBlack : headerLight,
      bgTopPos: 85,
      bgLeftPos: 0,
      bgRightPos: 0,
      bgBottomPos: -0.1,
      child: ReuseableWidgets().buildBackgroundContainer(
          isLightMode(context) ? Colors.white : Colors.black,
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
                Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                            height: 100,
                            child: CategoriesList(
                              itemsList: catList,
                              todo: () {},
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
                          style: TextStyle(fontFamily: interBold),
                        )),
                        const Text(
                          "Closing in: ",
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
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        const SizedBox(
                          width: 4,
                        ),
                        buildCountTimer(hours.toString(), 30),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text(":",
                            style: TextStyle(fontWeight: FontWeight.w600)),
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
                      return ProductItemCard(
                        product: Product(image: "assets/images/image 52.png",name: "Classy Top",price:Random().nextInt(1000).toDouble()
                      ));
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
            automaticallyImplyLeading: false,
            title: ReuseableWidgets().buildSearchBar(
                () => Get.to(() => const SearchScreen(),
                    transition: Transition.rightToLeft,
                    duration: const Duration(seconds: 1)),
                () {
                  Get.to(() => const SearchScreen(),
                      transition: Transition.rightToLeft,
                      duration: const Duration(seconds: 1));
                },

                isLightMode(context)),
            actions: [
              ReuseableWidgets().buildStackNotificationIcon(
                  63,
                  const Icon(CupertinoIcons.chat_bubble_text_fill,
                      color: Colors.white),
                  () => Get.to(() => const WishListScreen(), transition: Transition.rightToLeft, duration: const Duration(seconds: 1)
                  )
              ),

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
