
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:high_fashion/core/utils/helper-functions/helper-functions.dart';
import 'package:high_fashion/features/shared-widgets/reuseableWidgets.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: HAppBar(backArrowVisible: false,
      title: Text("Search",style: TextStyle(fontSize: 24),),centerTilt: false,
        actions: [
          ReuseableWidgets().buildStackNotificationIcon(
              63, Icon(CupertinoIcons.chat_bubble_text_fill), () => null),
        ],
      ),
      body: SafeArea(child: NestedScrollView(headerSliverBuilder: (context, innerBoxIsScrolled) {

        return [
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 450 ,
            automaticallyImplyLeading: true,
            flexibleSpace: Padding(
              padding: EdgeInsets.all(16),
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  //    SEARCH BAR
                  ReuseableWidgets().buildSearchBar(() {

                    // TOP BRANDS
                  },
                isLightMode(context)
              ),


                ],
              ),
            ),
          )
        ];
      }, body: Container())),


    );
  }
}
