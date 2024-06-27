import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:high_fashion/core/utils/constanst/assetsPaths.dart';
import 'package:high_fashion/features/shared-widgets/sharedWidgets.dart';

import 'controller/wishlist_controller.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoritesController favoritesController = Get.put(FavoritesController());


    return Scaffold(
        appBar: const HAppBar(
          centerTilt: true,
          automaticallyImplyLeading: false,
          title: Text(
            "Wishlist",
            style: TextStyle(fontFamily: interExtraBold, fontSize: 24),
          ),
          backArrowVisible: true,
        ),
        body: Obx(() {
                return favoritesController.favorites.isEmpty
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
                ) :  SingleChildScrollView(
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
                          childCount: favoritesController.favorites.length,
                          addAutomaticKeepAlives: true,
                          (context, index) {
                            final product =
                                favoritesController.favorites[index];
                            return ProductItemCard(product: product);
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
