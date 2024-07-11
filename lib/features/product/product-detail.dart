import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/core/utils/constanst/colors.dart';
import 'package:high_fashion/features/product/reviews-screen.dart';
import 'package:high_fashion/features/shared-widgets/sharedWidgets.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../core/utils/constanst/assetsPaths.dart';
import '../../core/utils/helper-functions/helper-functions.dart';
import '../wishlist/controller/wishlist_controller.dart';
import 'product-detail-controller.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FavoritesController favoritesController = Get.put(FavoritesController());
    final ProductDetailController productDetailController = Get.put(ProductDetailController());

    return Scaffold(
      bottomNavigationBar: Container(
        height: 90,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(0),bottomLeft: Radius.circular(0),bottomRight: Radius.circular(0)  ),
            boxShadow: [
              BoxShadow(color: isLightMode(context) ? Colors.black54 : Colors.white,blurRadius: 10.0,spreadRadius: 0.5,blurStyle: BlurStyle.outer)
            ],color: isLightMode(context) ? Colors.white : Colors.white10

        ),

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Expanded(
                child: Column(
                  children: [
                    Text("Total Price",style: TextStyle(color: Colors.grey),),
                    Text("₦${84}",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500,),),
                  ],
                ),
              ),
              const SizedBox(width: 50,),
              Expanded(
                flex: 2,
                  child: FilledButton.icon(
                      onPressed: () {},
                      icon: const Icon(Iconsax.bag_2),
                      label: const Text("Add to Cart"), style: const ButtonStyle(iconSize: MaterialStatePropertyAll(30),
                  fixedSize: MaterialStatePropertyAll(Size(double.infinity,50)),backgroundColor:  MaterialStatePropertyAll(lightWidgetColorBackground),foregroundColor: MaterialStatePropertyAll(Colors.white)
                  ),))
            ],
          ),
        ),
      ),
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
                          separatorBuilder: (context, index) => const SizedBox(
                                width: 6,
                              ),
                          itemCount: 4),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      flex: 3,
                      child: Text(
                        "Pretty Gown",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          CupertinoIcons.star_fill,
                          color: CupertinoColors.systemYellow,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "${[1.5,2.0,3.4,3.5,5.0,4.0,4.5,3.0,2.5].elementAt(Random().nextInt(9))}",
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Product Detail",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  child: Obx(
                    () => Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam in scelerisque sem. Mauris"
                          "volutpat, dolor id interdum ullamcorper, risus dolor egestas lectus, sit amet mattis purus"
                          "dui nec risus. Maecenas non sodales nisi, vel dictum dolor. Class aptent taciti sociosqu ad"
                          "litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse blandit eleifend"
                          "diam, vel rutrum tellus vulputate quis. Aliquam eget libero aliquet, imperdiet nisl a,"
                          "ornare ex. Sed rhoncus est ut libero porta lobortis. Fusce in dictum tellus.\n"
                          "Suspendisse interdum ornare ante. Aliquam nec cursus lorem. Morbi id magna felis. Vivamus"
                          "egestas, est a condimentum egestas, turpis nisl iaculis ipsum, in dictum tellus dolor sed"
                          "neque. Morbi tellus erat, dapibus ut sem a, iaculis tincidunt dui. Interdum et malesuada"
                          "fames ac ante ipsum primis in faucibus. Curabitur et eros porttitor, ultricies urna vitae,"
                          "molestie nibh. Phasellus at commodo eros, non aliquet metus. Sed maximus nisl nec dolor"
                          "bibendum, vel congue leo egestas.",
                      maxLines:
                          productDetailController.isProductDetailNotExpanded.value ? 2 : 1000,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: productDetailController.isProductDetailNotExpanded.value
                              ? Colors.grey
                              : Colors.black),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Obx(
                      () => InkWell(
                          child: Text(
                              productDetailController.isProductDetailNotExpanded.value
                                  ? "Read more"
                                  : "Read less",
                              style: TextStyle(
                                  color: isLightMode(context)
                                      ? lightWidgetColorBackground
                                      : darkWidgetColorBackground,
                                  decoration: TextDecoration.underline)),
                          onTap: () {
                            productDetailController.isProductDetailNotExpanded.value =
                                !productDetailController.isProductDetailNotExpanded.value;
                          }),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
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
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Select Size",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const Row(
                    children: [
                      Expanded(
                          child: SizedBox(
                              height: 50,
                              child: SizesList(
                                  itemsList: [

                                    SizesChoicesChip(label: "XS", toolTip: "Extra Small", index: 0),
                                    SizesChoicesChip(label: "S", toolTip: "Small", index: 1),
                                    SizesChoicesChip(label: "M", toolTip: "Medium", index: 2),
                                    SizesChoicesChip(label: "L", toolTip: "Large", index: 3),
                                    SizesChoicesChip(label: "XL", toolTip: "Extra Large", index: 4),
                                    SizesChoicesChip(label: "XXL", toolTip: "Extra Extra Large", index: 5),


                                  ],
                                  ))),
                    ],
                  ),
                const SizedBox(
                  height: 16,
                ),
                Obx(
                    () => RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Select Color: ",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: isLightMode(context)
                                ? Colors.black
                                : Colors.white)),
                    TextSpan(
                        text: productDetailController.selectedColor.value ,
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey)),
                  ])),
                ),
                const Row(
                    children: [
                      Expanded(
                          child: SizedBox(
                              height: 50,
                              child: SizesList(
                                  itemsList: [
                                    ColorChoicesChip(),
                                    ColorChoicesChip(),
                                    ColorChoicesChip(),
                                    ColorChoicesChip(),
                                    ColorChoicesChip(),
                                  ],
                                  ))),
                    ],
                  ),
                const SizedBox(
                  height: 12,
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
                const SizedBox(height: 12,),
                ReuseableWidgets().buildTextRow((){
                  Get.to(() => const ReviewsAndRatings(), transition: Transition.rightToLeft, duration: const Duration(seconds: 1));

                },CupertinoIcons.checkmark_seal_fill,"Reviews (99+)",CupertinoIcons.forward,isLightMode(context)),


              ],
            ),
          )
        ],
      )),
    );
  }
}

class ColorChoicesChip extends StatelessWidget {
  const ColorChoicesChip({
    super.key,
  });




  @override
  Widget build(BuildContext context) {
    final ProductDetailController productDetailController = Get.put(ProductDetailController());
    final index = Random().nextInt(30);

    return Obx(
      () => ChoiceChip(selected: productDetailController.selectedColor.value == colorNames[index],
          labelStyle: TextStyle(fontSize: 18,color: productDetailController.selectedColor.value == colorNames[index] ? Colors.white : null ),
           onSelected: (size){
             productDetailController.selectedColor.value = colorNames[index];
           },
          selectedColor: colorList[index] ,
        backgroundColor:colorList[index]  ,
          shape: const CircleBorder(),
          labelPadding: const EdgeInsets.all(0), label: const Text(""),



      ),
    );
  }
}


class SizesChoicesChip extends StatelessWidget {
  const SizesChoicesChip({
    super.key, required this.label, required this.toolTip, required this.index,
  });

  final String label;
  final String toolTip;
  final int index;


  @override
  Widget build(BuildContext context) {
    final ProductDetailController productDetailController = Get.put(ProductDetailController());

    return Obx(
      () =>  ChoiceChip(label: Text(label), selected: productDetailController.selectedSize.value == label,
          labelStyle: TextStyle(fontSize: 18,color: productDetailController.selectedSize.value == label ? Colors.white : null ),
           onSelected: (size){
             productDetailController.selectedSize.value = label;
           }, tooltip: toolTip,
      ),
    );
  }
}
