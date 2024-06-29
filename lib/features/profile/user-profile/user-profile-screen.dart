import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/core/utils/helper-functions/helper-functions.dart';
import 'package:high_fashion/features/profile/user-profile/update-name-screen.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../core/utils/constanst/assetsPaths.dart';
import '../../../core/utils/constanst/colors.dart';
import '../../shared-widgets/sharedWidgets.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReuseableWidgets().buildAppScreenBackGround(
        headerImg: isLightMode(context) ? headerBlack : headerLight,
        bgTopPos: 85,
        bgLeftPos: 0,
        bgRightPos: 0,
        bgBottomPos: 0,
        child: ReuseableWidgets().buildBackgroundContainer(
            isLightMode(context) ? Colors.white : Colors.black,
            65,
            0,
            0,
            0,
            SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                      left: isSmallScreen(context) ? 16 : 50,
                      right: isSmallScreen(context) ? 16 : 50,
                      top: isSmallScreen(context) ? 0 : 20,
                      bottom: isSmallScreen(context) ? 0 : 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      // User Image
                      Center(

                        child:
                          const Text("User Name",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600)),

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
                      SizedBox(height: 10,),
                      Text(
                        "Profile Information",
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20,),
                      ),
                      SizedBox(height: 8,),
                      buildInkWellText((){

                      },"Name","User Name",CupertinoIcons.forward,context),
                      buildInkWellText((){
                        Get.to(() => UpDateNameScreen(),transition: Transition.native,duration: Duration(seconds: 1));
                      },"User Name","User Name",CupertinoIcons.forward,context),
                      SizedBox(height: 10,),
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
                      SizedBox(height: 10,),
                      Text(
                        "Personal Information",
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20,),
                      ),
                      SizedBox(height: 8,),
                      buildInkWellText((){},"User ID","DBSDB3727",Iconsax.user_octagon_copy,context),
                      buildInkWellText((){},"Phone Number","+1 (987)-8796",CupertinoIcons.forward,context),
                      buildInkWellText((){},"E-mail","chinazablossom7@gmail.com",CupertinoIcons.forward,context),
                      buildInkWellText((){},"Gender","Female",CupertinoIcons.forward,context),
                      SizedBox(height: 10,),
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
                      SizedBox(height: 30,),
                      ReuseableWidgets().largeAppBtn("Logout", () => null,
                      isLightMode(context) ? lightWidgetColorBackground : darkWidgetColorBackground,
                      Colors.white
                      ),

                    ],
                  ),
                ))),
        childOp: Column(
          children: [
            HAppBar(
              centerTiltle: false,
              backArrowVisible: false,
              automaticallyImplyLeading: false,
              leading: IconButton(
                  onPressed: Get.back,
                  icon: Icon(CupertinoIcons.back,
                    color: isLightMode(context) ? Colors.white : Colors.black,
                    size: 28,)
              ),
              title: Text(
                "Your Profile",
                style: TextStyle(
                    fontFamily: interBold,
                    fontSize: 24,
                    color: isLightMode(context) ? Colors.white : Colors.black),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
          ],
        ),
      ),
    );
  }

  InkWell buildInkWellText(Function() todo,String label,String data,IconData endIcon,BuildContext context) {
    return InkWell(
                      onTap: todo,
                      splashColor: lightWidgetColorBackground.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      child: Column(
                        children: [
                          SizedBox(height: 8,),
                          Row(
                            children: [
                              Expanded(flex: 2,child: Text(label,style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w500),)),
                              Expanded(flex: 5, child: Text(data,style: TextStyle(fontSize: 16),)),
                              Expanded(child: Icon(endIcon,color: isLightMode(context) ? lightWidgetColorBackground : darkWidgetColorBackground,size: 28)),

                            ],
                          ),
                          SizedBox(height: 8,),
                        ],
                      ),
                    );
  }
}
