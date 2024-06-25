import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/core/utils/helper-functions/helper-functions.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:transparent_image/transparent_image.dart';

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

  GestureDetector largeAppIconBtn(bool isLightMode, IconData icon, Function() todo) {
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



  Container imgContainer(double height, double width, double radius, String imgPath) {
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



  Container iconContainer(double height, double width, IconData icon, bool isLightMode) {
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




  SearchBar buildSearchBar(Function()? onTap , bool isLightMode ) {
    return SearchBar(
      backgroundColor:  MaterialStatePropertyAll<Color>(isLightMode ? lightBackground.withOpacity(0.9) : const Color(0xff1d1c1f)) ,
      hintText: "Search...",
      hintStyle: MaterialStatePropertyAll(TextStyle(color: isLightMode ? const Color(0xff646060) : Colors.white)),
      onTap: onTap,
      leading:  Icon(CupertinoIcons.search,color: isLightMode ? lightWidgetColorBackground : Colors.white),
      trailing: [
        IconButton(onPressed: (){},icon: Icon(CupertinoIcons.mic,color:isLightMode ? lightWidgetColorBackground : Colors.white))
      ],

    );
  }

  Stack buildStackNotificationIcon(int notifCount,Widget icon,Function() todo ) {
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
              icon: icon ),
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
    this.onTapLeadingIcon, required this.centerTilt,
  });

  final Widget? leading;
  final void Function()? onTapLeadingIcon;
  final Widget? title;
  final bool centerTilt;
  final List<Widget>? actions;
  final bool backArrowVisible;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppBar(
        leading: backArrowVisible ? IconButton(onPressed: () { Get.back();},
                icon: const Icon(
                  CupertinoIcons.back,
                  color: Colors.white,
                  size: 30,
                ))
            : leading,
        title: title,
        centerTitle: centerTilt,
        actions: actions,
        titleSpacing: 6,

      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 50);
}


class ProductItemCard extends StatelessWidget {
  const ProductItemCard({super.key, required this.imgPath, required this.productName, required this.price, this.todo});

  final String imgPath;
  final String productName;
  final double price;
  final Function()? todo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        todo;
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        clipBehavior: Clip.hardEdge,elevation: 5,
        color: isLightMode(context) ? lightBackground : Colors.black26,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    height: 160 ,width: double.infinity,
                    color: colorList[Random().nextInt(30)],
                    child: FadeInImage(
                        fit: BoxFit.contain,
                        placeholder: MemoryImage(kTransparentImage) ,
                        image: AssetImage(imgPath)  /* NetworkImage(meal.imageUrl)*/ ),
                  ),
                ),
                const Positioned(
                  top: 8,
                  right: 4,
                  child: CircleAvatar(
                    backgroundColor: Colors.white54,
                    child: Icon(
                      Iconsax.heart_copy,
                      color: lightWidgetColorBackground,
                    ),
                  ),
                ),


              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 160, child: Text(productName,style: const TextStyle(fontFamily: interMedium),maxLines: 1,overflow: TextOverflow.ellipsis)),
                  const SizedBox(height: 6,),
                  Text("\$$price",style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),


                ],


              ),



            ),

          ],
        ),
      ),
    ); ;
  }
}


class carouselImg extends StatelessWidget {
  const carouselImg({
    super.key,
    required this.url,
    required this.isNetworkImage,
    this.todo,
    this.height = 150,
    this.width = 320,
  });

  final String url;
  final bool isNetworkImage;
  final Function()? todo;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: todo,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image(
              image: isNetworkImage
                  ? NetworkImage(url)
                  : AssetImage(url) as ImageProvider,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high),
        ),
      ),
    );
  }
}

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key, required this.itemsList});

  final Map<String,String> itemsList;

  @override
  Widget build(BuildContext context) {
   return ListView.builder(
     itemCount: itemsList.keys.length ,
     scrollDirection: Axis.horizontal,
     shrinkWrap: true,
     itemBuilder: (context, index) {
     return Padding(
       padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
       child: Column(
           children: [
             Container(
               height: 60,
               width: 60,
               padding: const EdgeInsets.all(16),
               decoration: BoxDecoration(
                   color:  const Color(0xffe7e7ec),
                   borderRadius: BorderRadius.circular(100)
               ),
               child: Image(height: 40,width: 40,image: AssetImage(itemsList.entries.elementAt(index).value)),
             ),
             const SizedBox(height: 6,),
             Text(itemsList.entries.elementAt(index).key,style: const TextStyle(fontSize: 15,color: Colors.black),)
           ],
         ),
     );

   },);
  }


}



  const catList = {
    "Accessories" : eyeglassIcon,
    "Beach wear": bikiniIcon,
    "Bags" : bagsIcon,
    "Dresses" : dressIcon,
    "Jewelry" : earringsIcon,
    "Shoes" : shoeIcon,
    "Shirts" : shirtIcon,
    "Skirts" : skirtIcon,
};


List<Color> colorList = [
  const Color(0xFF421220),
  const Color(0xFF203157),
  const Color(0xFF48281E),
  const Color(0xFF083041),
  const Color(0xFF572B4B),
  const Color(0xFF342646),
  const Color(0xFF804400),
  const Color(0xFF4D4D1E),
  const Color(0xFF3A2326),
  const Color(0xFFA8B052),
  const Color(0xFF1B503E),
  const Color(0xFF334D29),
  const Color(0xFF261B54),
  const Color(0xFF8A5E65),
  const Color(0xFF85573E),
  const Color(0xFF572E2E),
  const Color(0xFF246742),
  const Color(0xFF375873),
  const Color(0xFF5749A9),
  const Color(0xFF69270F),
  const Color(0xFF5F7C24),
  const Color(0xFF460E48),
  const Color(0xFF541F1F),
  const Color(0xFFAB966C),
  const Color(0xFFC49E71),
  const Color(0xFFA25048),
  const Color(0xFF778899),
  const Color(0xFF5D6B7C),
  const Color(0xFF443A81),
  const Color(0xFF1C4E4F),
];


Container buildCountTimer(String time,double width) {
  return Container(
    height: 30,
    width: width,
    decoration: BoxDecoration(
        color: lightWidgetColorBackground.withOpacity(0.199),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8)
    ),
    child: Center(child: Text(time,
      style: const TextStyle(color: lightWidgetColorBackground,fontWeight: FontWeight.w500),)),
  );
}

