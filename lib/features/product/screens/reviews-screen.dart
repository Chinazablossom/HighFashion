import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/constanst/assetsPaths.dart';
import '../../shared-widgets/sharedWidgets.dart';

class ReviewsAndRatings extends StatelessWidget {
  const ReviewsAndRatings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Reviews And Ratings",
          style: TextStyle(fontFamily: interBold, fontSize: 22),
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
            ItemRating(),
            const SizedBox(
              height: 35,
            ),
            BuildUserComment(context: context, hasResponse: true),
            BuildUserComment(
                userName: "Ann Doe",
                userImage: toniLogo,
                userComment:
                    "Wow I love this Store the dress came in less than a week",
                context: context,
                hasResponse: false),
            BuildUserComment(context: context, hasResponse: false),
            BuildUserComment(context: context, hasResponse: true),
            BuildUserComment(
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
