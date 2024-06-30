import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/core/utils/constanst/colors.dart';
import 'package:high_fashion/features/shared-widgets/sharedWidgets.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../core/utils/constanst/assetsPaths.dart';
import '../wishlist/controller/wishlist_controller.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoritesController favoritesController =
        Get.put(FavoritesController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              color: colorList[Random().nextInt(30)],
              child: Stack(
                children: [
                  Positioned(
                      left: 12,
                      top: 35,
                      child: GestureDetector(
                        onTap: Get.back,
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.grey.shade200),
                          child: const Icon(
                            CupertinoIcons.back,
                            color: lightWidgetColorBackground,
                            size: 28,
                          ),
                        ),
                      )),
                  Positioned(
                      right: 12,
                      top: 35,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.grey.shade200),
                          child: /*Obx(() =>*/ const CircleAvatar(
                              backgroundColor: Colors.white54,
                              child: Icon(
                                /*  favoritesController.isFavorite(product)
                              ? Iconsax.heart
                              : Iconsax.heart_copy,*/
                                Iconsax.heart_copy,
                                color: lightWidgetColorBackground,
                                // ),
                              )),
                        ),
                      )),
                  const Positioned(
                    top: 50,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Center(
                      child: SizedBox(
                          height: 400,
                          width: 300,
                          child: Image(
                              image: AssetImage("assets/images/image 108.png"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Positioned(
                    top: 310,
                    right: 18,
                    left: 30,
                    child: SizedBox(
                      height: 80,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListView.separated(
                            padding: const EdgeInsets.only(
                                left: 4, top: 2, bottom: 2, right: 4),
                            itemBuilder: (context, index) {
                              return const carouselImg(
                                url: ankaraImgPath,
                                height: 80,
                                width: 80,
                              );
                            },
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 6,
                                ),
                            itemCount: 4),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )
      /*NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: colorList[Random().nextInt(30)],
                floating: true,
                title: GestureDetector(
                  onTap: Get.back,
                  child: Container(
                    height: 55, width: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey.shade200
                    ),
                    child: Icon(
                      CupertinoIcons.back, color: lightWidgetColorBackground,
                      size: 28,),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: GestureDetector(
                      onTap: Get.back,
                      child: Container(
                        height: 55, width: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey.shade200
                        ),
                        child: Icon(
                          Iconsax.heart, color: lightWidgetColorBackground,
                          size: 28,),
                      ),
                    ),
                  )
                ],
                pinned: true,
                automaticallyImplyLeading: false,
                expandedHeight: 360,
                forceElevated: innerBoxIsScrolled,
                flexibleSpace: Stack(
                    children: [Center(
                      child: SizedBox(height: 200,
                          width: 200,
                          child: Image(
                              image: AssetImage("assets/images/image 52.png"),
                              fit: BoxFit.cover)),
                    ),
                    ]
                ),
                bottom: PreferredSize(
                  preferredSize: Size(double.infinity, 50),
                  child: ReuseableWidgets().buildBackgroundContainer(
                      isLightMode(context) ? Colors.white : Colors.black, 40, 40, 0, 0, Container()),
                )
                ,
              )
            ];
          },
          body: ReuseableWidgets().buildBackgroundContainer(
              isLightMode(context) ? Colors.white : Colors.black, 40, 40, 0, 0, Container())

    )*/
      ,
    );
  }
}
