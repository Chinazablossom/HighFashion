import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:get/get.dart';
import 'package:high_fashion/features/product/product-detail-controller.dart';
import 'package:intl/intl.dart';

import '../../core/utils/constanst/assetsPaths.dart';
import '../../core/utils/constanst/colors.dart';
import '../../core/utils/constanst/texts.dart';
import '../../core/utils/helper-functions/helper-functions.dart';

class ReviewsAndRatings extends StatelessWidget {
  const ReviewsAndRatings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Reviews And Ratings",
          style: TextStyle(fontFamily: interExtraBold, fontSize: 22),
        ),
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              CupertinoIcons.back,
              size: 30,
            )),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ratings and Reviews are all verified from real people who have purchased and used the product, providing you with an accurate and trustworthy representation of the product's quality and performance.",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            itemRating(),
            const SizedBox(
              height: 35,
            ),
            buildUserComment(context: context, hasResponse: true),
            buildUserComment(
                userName: "Ann Doe",
                userImage: toniLogo,
                userComment:
                    "Wow I love this Store the dress came in less than a week",
                context: context,
                hasResponse: false),
            buildUserComment(context: context, hasResponse: false),
            buildUserComment(context: context, hasResponse: true),
            buildUserComment(
                userName: "Jane Doe",
                userImage: toniLogo,
                userComment: "Item looks exactly as in Photo so happy 😊",
                context: context,
                hasResponse: false),
          ],
        ),
      ),
    );
  }
}

class buildUserComment extends StatelessWidget {
  const buildUserComment({
    super.key,
    this.userName = "Anonymous",
    this.userImage = "assets/images/image 500.png",
    this.userComment = defaultText,
    required this.context,
    required this.hasResponse,
  });

  final String userName;
  final String userImage;
  final String userComment;
  final BuildContext context;
  final bool hasResponse;

  @override
  Widget build(BuildContext context) {
    final ProductDetailController productDetailController =
        Get.put(ProductDetailController());
    final randomNum = [1.0, 1.5, 2.0, 3.5, 5.0, 4.0, 4.5, 3.0, 2.5]
        .elementAt(Random().nextInt(9));
    final randomDate = DateTime(
        [2020, 2021, 2022, 2023, 2024].elementAt(Random().nextInt(5)),
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].elementAt(Random().nextInt(12)),
        [
          1,
          2,
          3,
          4,
          5,
          6,
          7,
          8,
          9,
          10,
          11,
          12,
          13,
          14,
          15,
          16,
          17,
          18,
          19,
          20,
          21,
          22,
          23,
          24,
          25,
          26,
          27,
          28
        ].elementAt(Random().nextInt(25)));

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(userImage),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    userName,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PannableRatingBar(
                rate: randomNum,
                items: List.generate(
                  5,
                  (index) => const RatingWidget(
                    selectedColor: CupertinoColors.systemYellow,
                    unSelectedColor: Colors.grey,
                    child: Icon(
                      Icons.star,
                      size: 17,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                  "${randomDate.day} ${DateFormat("MMM").format(randomDate)}, ${randomDate.year}")
            ],
          ),
          spannableText(
              text: userComment,
              productDetailController: productDetailController,
              context: context,
              position: Alignment.topRight),
          const SizedBox(
            height: 16,
          ),
          hasResponse
              ? buildCompanyReply(
                  context: context,
                  randomDate: randomDate,
                  productDetailController: productDetailController)
              : Container(),
        ],
      ),
    );
  }
}

Container buildCompanyReply(
    {String reply = defaultText,
    required BuildContext context,
    required DateTime randomDate,
    required ProductDetailController productDetailController}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
            color: isLightMode(context) ? Colors.black54 : Colors.white,
            blurRadius: isLightMode(context) ? 3.0 : 1.5,
            spreadRadius: 0.5,
            blurStyle: BlurStyle.normal),
      ],
      color: isLightMode(context) ? Colors.white : Colors.black,
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("H'Fash Store",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
              Text(
                  "${randomDate.day} ${DateFormat("MMM").format(randomDate)}, ${randomDate.year}",
                  style: Theme.of(context).textTheme.titleMedium)
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          spannableText(
              text: reply,
              productDetailController: productDetailController,
              context: context,
              position: Alignment.topLeft),
        ],
      ),
    ),
  );
}

Column spannableText(
    {String text = defaultText,
    required ProductDetailController productDetailController,
    required BuildContext context,
    required AlignmentGeometry position}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 8, left: 8),
        child: Obx(
          () => Text(
            text,
            textAlign: TextAlign.start,
            maxLines: productDetailController.isProductDetailNotExpanded.value
                ? 2
                : 1000,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: productDetailController.isProductDetailNotExpanded.value
                    ? Colors.grey
                    : isLightMode(context)
                        ? Colors.black
                        : Colors.white),
          ),
        ),
      ),
      Align(
        alignment: position,
        child: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: text.length < 50
              ? null
              : Obx(
                  () => InkWell(
                      child: Text(
                          productDetailController
                                  .isProductDetailNotExpanded.value
                              ? "Read more"
                              : "Read less",
                          style: TextStyle(
                              color: isLightMode(context)
                                  ? lightWidgetColorBackground
                                  : darkWidgetColorBackground,
                              decoration: TextDecoration.underline)),
                      onTap: () {
                        productDetailController
                                .isProductDetailNotExpanded.value =
                            !productDetailController
                                .isProductDetailNotExpanded.value;
                      }),
                ),
        ),
      ),
    ],
  );
}

class itemRating extends StatelessWidget {
  const itemRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final randomNum = [1.0, 1.5, 2.0, 3.5, 5.0, 4.0, 4.5, 3.0, 2.5]
        .elementAt(Random().nextInt(9));

    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Text(
                "${randomNum}",
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 55),
              ),
              PannableRatingBar(
                rate: randomNum,
                items: List.generate(
                  5,
                  (index) => const RatingWidget(
                    selectedColor: CupertinoColors.systemYellow,
                    unSelectedColor: Colors.grey,
                    child: Icon(
                      Icons.star,
                      size: 17,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
            flex: 6,
            child: Column(
              children: List.generate(
                  5, (index) => ratingRow(amountOfRaters: "${-index + 5}")),
            ))
      ],
    );
  }
}

class ratingRow extends StatelessWidget {
  const ratingRow({
    super.key,
    required this.amountOfRaters,
  });

  final String amountOfRaters;

  @override
  Widget build(BuildContext context) {
    final rate = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1]
        .elementAt(Random().nextInt(11))
        .toDouble();

    return Row(
      children: [
        Expanded(child: Text(amountOfRaters)),
        Expanded(
          flex: 13,
          child: SizedBox(
            width: double.infinity,
            child: LinearProgressIndicator(
              value: rate,
              minHeight: 10,
              backgroundColor: Colors.grey,
              valueColor:
                  const AlwaysStoppedAnimation(lightWidgetColorBackground),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        )
      ],
    );
  }
}
