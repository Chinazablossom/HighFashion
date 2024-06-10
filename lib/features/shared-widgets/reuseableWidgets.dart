import 'package:flutter/material.dart';

import '../../core/utils/constanst/assetsPaths.dart';
import '../../core/utils/constanst/colors.dart';


class ReuseableWidgets {
  ///   WIDGETS
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
          color: isLightMode
              ? darkWidgetColorBackground
              : lightWidgetColorBackground,
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
}
