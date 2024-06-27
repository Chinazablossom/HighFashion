import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:high_fashion/core/utils/constanst/assetsPaths.dart';
import 'package:high_fashion/core/utils/constanst/colors.dart';
import 'package:high_fashion/core/utils/helper-functions/helper-functions.dart';
import 'package:high_fashion/features/shared-widgets/sharedWidgets.dart';

import '../../core/models/product_model.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: HAppBar(
          backArrowVisible: false,
          automaticallyImplyLeading: true,
          title: const Text(
            "Search",
            style: TextStyle(fontSize: 24),
          ),
          centerTiltle: false,
          actions: [
            ReuseableWidgets().buildStackNotificationIcon(
                63, const Icon(CupertinoIcons.chat_bubble_text_fill), () => null),
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    floating: true,
                    pinned: true,
                    automaticallyImplyLeading: false,
                    expandedHeight: 330,
                    forceElevated: innerBoxIsScrolled,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.all(16),
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          //    SEARCH BAR
                          ReuseableWidgets().buildSearchBar(
                              null, () {}, isLightMode(context)),
                          const SizedBox(
                            height: 8,
                          ),

                          // TOP BRAND
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Top Brands",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text("View all",
                                    style: TextStyle(
                                        color: isLightMode(context)
                                            ? lightWidgetColorBackground
                                            : darkWidgetColorBackground)),
                              )
                            ],
                          ),

                          GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 65,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 9,
                            ),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return buildTopBrandContainer(
                                  logos[index],
                                  brandName[index],
                                  Random().nextInt(150),
                                  100,
                                  lightWidgetColorBackground);
                            },
                          )
                        ],
                      ),
                    ),
                    bottom: PreferredSize(
                      preferredSize: const Size(double.infinity, 48),
                      child: Material(
                        color:
                            isLightMode(context) ? Colors.white : Colors.black,
                        child: TabBar(
                            isScrollable: true,
                            unselectedLabelColor: Colors.grey,
                            labelColor: isLightMode(context)
                                ? Colors.black
                                : Colors.white,
                            splashBorderRadius: BorderRadius.circular(15),
                            tabAlignment: TabAlignment.start,
                            indicatorColor: isLightMode(context)
                                ? lightWidgetColorBackground
                                : darkWidgetColorBackground,
                            tabs: [
                              const Tab(text: "Accessories"),
                              const Tab(text: "Beach Wear"),
                              const Tab(text: "Bags"),
                              const Tab(text: "Dresses"),
                              const Tab(text: "Jewelry"),
                              const Tab(text: "Shoes"),
                              const Tab(text: "Shirts"),
                              const Tab(text: "Skirts"),
                            ]),
                      ),
                    )),
              ];
            },
            body: TabBarView(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 16,left: 10,right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Top Selling",style: TextStyle(fontFamily: interBold,fontSize: 20,),),
                      buildProductDisplay(() => null, "Accessories", [
                        corsetImgPath,ankaraImgPath,jewelryAndNailImgPath,maxiSkirtImgPath
                      ]),
                      const Text("Trending",style: TextStyle(fontFamily: interBold,fontSize: 20,),),
                      const SizedBox(height: 8,),
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
                                )
                            );
                          },
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      )

                    ],
                  ),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 16,left: 10,right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Top Selling",style: TextStyle(fontFamily: interBold,fontSize: 20,),),
                      buildProductDisplay(() => null, "BeachWear", [
                        corsetImgPath,ankaraImgPath,jewelryAndNailImgPath,maxiSkirtImgPath
                      ]),
                      const Text("Trending",style: TextStyle(fontFamily: interBold,fontSize: 20,),),
                      const SizedBox(height: 8,),
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
                                product: Product(image: "assets/images/image 52.png",name: "Classy Top",price:Random().nextInt(1000).toDouble())
                            );
                          },
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      )

                    ],
                  ),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 16,left: 10,right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Top Selling",style: TextStyle(fontFamily: interBold,fontSize: 20,),),
                      buildProductDisplay(() => null, "Bags", [
                        corsetImgPath,ankaraImgPath,jewelryAndNailImgPath,maxiSkirtImgPath
                      ]),
                      const Text("Trending",style: TextStyle(fontFamily: interBold,fontSize: 20,),),
                      const SizedBox(height: 8,),
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
                                product: Product(image: "assets/images/image 52.png",name: "Classy Top",price:Random().nextInt(1000).toDouble())
                            );
                          },
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      )

                    ],
                  ),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 16,left: 10,right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Top Selling",style: TextStyle(fontFamily: interBold,fontSize: 20,),),
                      buildProductDisplay(() => null, "Dresses", [
                        corsetImgPath,ankaraImgPath,jewelryAndNailImgPath,maxiSkirtImgPath
                      ]),
                      const Text("Trending",style: TextStyle(fontFamily: interBold,fontSize: 20,),),
                      const SizedBox(height: 8,),
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
                                product: Product(image: "assets/images/image 52.png",name: "Classy Top",price:Random().nextInt(1000).toDouble())
                            );
                          },
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      )

                    ],
                  ),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 16,left: 10,right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Top Selling",style: TextStyle(fontFamily: interBold,fontSize: 20,),),
                      buildProductDisplay(() => null, "Jewelry", [
                        corsetImgPath,ankaraImgPath,jewelryAndNailImgPath,maxiSkirtImgPath
                      ]),
                      const Text("Trending",style: TextStyle(fontFamily: interBold,fontSize: 20,),),
                      const SizedBox(height: 8,),
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
                                product: Product(image: "assets/images/image 52.png",name: "Classy Top",price:Random().nextInt(1000).toDouble())
                            );
                          },
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      )

                    ],
                  ),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 16,left: 10,right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Top Selling",style: TextStyle(fontFamily: interBold,fontSize: 20,),),
                      buildProductDisplay(() => null, "Shoes", [
                        corsetImgPath,ankaraImgPath,jewelryAndNailImgPath,maxiSkirtImgPath
                      ]),
                      const Text("Trending",style: TextStyle(fontFamily: interBold,fontSize: 20,),),
                      const SizedBox(height: 8,),
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
                                product: Product(image: "assets/images/image 52.png",name: "Classy Top",price:Random().nextInt(1000).toDouble())
                            );
                          },
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      )

                    ],
                  ),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 16,left: 10,right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Top Selling",style: TextStyle(fontFamily: interBold,fontSize: 20,),),
                      buildProductDisplay(() => null, "Shirts", [
                        corsetImgPath,ankaraImgPath,jewelryAndNailImgPath,maxiSkirtImgPath
                      ]),
                      const Text("Trending",style: TextStyle(fontFamily: interBold,fontSize: 20,),),
                      const SizedBox(height: 8,),
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
                                product: Product(image: "assets/images/image 52.png",name: "Classy Top",price:Random().nextInt(1000).toDouble())
                            );
                          },
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      )

                    ],
                  ),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 16,left: 10,right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Top Selling",style: TextStyle(fontFamily: interBold,fontSize: 20,),),
                      buildProductDisplay(() => null, "Skirts", [
                        corsetImgPath,ankaraImgPath,jewelryAndNailImgPath,maxiSkirtImgPath
                      ]),
                      const Text("Trending",style: TextStyle(fontFamily: interBold,fontSize: 20,),),
                      const SizedBox(height: 8,),
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
                                product: Product(image: "assets/images/image 52.png",name: "Classy Top",price:Random().nextInt(1000).toDouble())
                            );
                          },
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      )

                    ],
                  ),
                ),


              ],
            )),
      ),
    );
  }






}







