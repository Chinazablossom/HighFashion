import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/constanst/assetsPaths.dart';
import '../../core/utils/constanst/colors.dart';
///   WIDGETS

class ReuseableWidgets {

  GestureDetector largeBtn(bool isLightMode, String label, Function() todo) {
    return GestureDetector(
      onTap: todo,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isLightMode ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Text(label,
                style: TextStyle(
                    fontFamily: interExtraBold,
                    color: isLightMode ? Colors.white : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold))),
      ),
    );
  }



  GestureDetector largeAppBtn(bool isLightMode, String label, Function() todo) {
    return GestureDetector(
      onTap: todo,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isLightMode
              ? lightWidgetColorBackground
              : darkWidgetColorBackground,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Text(label,
                style: const TextStyle(
                    fontFamily: interExtraBold,
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold))),
      ),
    );
  }



  GestureDetector largeAppIconBtn(
      bool isLightMode, IconData icon, Function() todo) {
    return GestureDetector(
      onTap: todo,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: lightWidgetColorBackground,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Icon(
          icon,
          color: Colors.white,
        )),
      ),
    );
  }

  Stack buildAppScreenBackGround({required String headerImg,
    required double? bgTopPos,
    required double? bgLeftPos,
    required double? bgRightPos,
    required double? bgBottomPos,
    required Widget child,
    required Widget childOp,

  }) {
    return Stack(children: [
      ReuseableWidgets().buildHeader(headerImg, null),
      Positioned(
          top: bgTopPos,
          left: bgLeftPos,
          right: bgRightPos,
          bottom: bgBottomPos,
          child: Container(child: child,)),
          childOp

    ]);
  }


  Container buildHeader(String imgPath, Widget? child) {
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover)),
      child: child,
    );
  }



  Container imgContainer(
      double height, double width, double radius, String imgPath) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: lightWidgetColorBackground,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(radius),
        image: DecorationImage(
            image: AssetImage(
              imgPath,
            ),
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover),
      ),
    );
  }



  Container iconContainer(
      double height, double width, IconData icon, bool isLightMode) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: isLightMode
            ? lightWidgetColorBackground
            : darkWidgetColorBackground,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }



  Column pageView(
    bool isLightMode,
    String? title,
    String? highlightedTxt,
    String? body,
    String? imgPath,
    int pageNum,
  ) {
    return Column(
      children: [
        SizedBox(
          height: 430,
          width: double.infinity,
          child: Image.asset(imgPath!),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
              text: title,
              style: TextStyle(
                  fontFamily: interExtraBold,
                  fontSize: 24,
                  color: isLightMode ? Colors.black : Colors.white),
            ),
            TextSpan(
              text: highlightedTxt,
              style: TextStyle(
                fontFamily: interExtraBold,
                fontSize: 24,
                color: isLightMode
                    ? lightWidgetColorBackground
                    : darkWidgetColorBackground,
              ),
            )
          ]),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          body!,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }



  Container buildBackgroundContainer(
    Color containerColor,
    double topLeft,
    double topRight,
    double bottomLeft,
    double bottomRight,
    Widget? child,
  ) {
    return Container(
      decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeft),
              topRight: Radius.circular(topRight),
              bottomLeft: Radius.circular(bottomLeft),
              bottomRight: Radius.circular(bottomRight))),
      child: child,
    );
  }




  SearchBar buildSearchBar(Function()? onTap ) {
    return SearchBar(
      backgroundColor:  MaterialStatePropertyAll<Color>(lightBackground.withOpacity(0.9)) ,
      padding: const MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(horizontal: 16.0)),
      controller: TextEditingController(),
      hintText: "Search...",
      shadowColor:  const MaterialStatePropertyAll<Color>(Colors.white),
      onTap: onTap,
      leading: const Icon(CupertinoIcons.search,color:lightWidgetColorBackground),
      trailing: [
        IconButton(onPressed: (){},icon: const Icon(CupertinoIcons.mic,color:lightWidgetColorBackground))
      ],

    );
  }

  Stack buildStackNotificationIcon(int notifCount,IconData icon,Function() todo ) {
    return Stack(
        children: [
          Positioned(
              width: notifCount >= 100 ? 16 : notifCount >= 10 ? 22 : 17,
              height: notifCount >= 100 ? 16 : notifCount >= 10 ? 19 : 18  ,
              right: 0,
              top: notifCount >= 100 ? 5 : 0,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(100)
                ),
                child: Center(child: Text(notifCount >= 100 ? "" : notifCount.toString(),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 14),),),
              )) ,

          IconButton(
              onPressed: todo,
              icon:  Icon(icon)),
        ]);
  }












}

class HAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HAppBar({
    super.key,
    this.leading,
    this.title,
    this.actions,
    required this.backArrowVisible,
    this.onTapLeadingIcon,
  });

  final Widget? leading;
  final void Function()? onTapLeadingIcon;
  final Widget? title;
  final List<Widget>? actions;
  final bool backArrowVisible;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppBar(
        leading: backArrowVisible
            ? IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  CupertinoIcons.back,
                  color: Colors.white,
                  size: 30,
                ))
            : leading,
        title: title,
        titleTextStyle: const TextStyle(color: Colors.white),
        actions: actions,
        titleSpacing: 6,

      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 50);
}
