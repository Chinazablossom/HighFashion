import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:high_fashion/core/utils/constanst/assetsPaths.dart';
import 'package:high_fashion/features/shared-widgets/sharedWidgets.dart';

import '../product/controllers/product-global-controllers.dart';
import '../product/screens/product-detail.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalController globalController = Get.find();


    return Scaffold(
        appBar:  AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: const Text(
            "Wishlist",
            style: TextStyle(fontFamily: interBold, fontSize: 22),
          ),
          leading: GestureDetector(
              onTap: (){
                Navigator.pop(context) ;
              },
              child: const Icon(
                CupertinoIcons.back,
                size: 30,
              )),

        ),
        body: Obx(() {
          return globalController.favorites.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage(ghostAnimation)),
                      Text(
                        "Oh no so empty...",
                        style: TextStyle(fontFamily: interBold, fontSize: 18),
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 16, left: 10, right: 10),
                  child: SafeArea(
                    child: Expanded(
                      child: GridView.custom(
                        gridDelegate: SliverStairedGridDelegate(
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 20,
                            tileBottomSpace: 80,
                            pattern: [
                              const StairedGridTile(0.5, 1),
                              const StairedGridTile(0.5, 1),
                            ]),
                        childrenDelegate: SliverChildBuilderDelegate(
                          childCount: globalController.favorites.length,
                          addAutomaticKeepAlives: true,
                          (context, index) {
                            final product = globalController.favorites[index];
//                            return ProductItemCard(product: product);
                            return ProductItemCard(product: product, onTap: () {
                              Get.to(ProductDetailScreen(product: product));
                            });
                          },
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      ),
                    ),
                  ),
                );
        }));
  }
}
