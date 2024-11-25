import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:high_fashion/core/models/card-model.dart';
import 'package:high_fashion/core/utils/constanst/colors.dart';
import 'package:high_fashion/core/utils/helper-functions/helper-functions.dart';
import 'package:high_fashion/features/shared-widgets/sharedWidgets.dart';

import '../../../core/utils/constanst/assetsPaths.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    DebitCard card = demoCard[0];

    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                CupertinoIcons.back,
                size: 30,
              )),
          title: const Text(
            "Add Card",
            style: TextStyle(
              fontFamily: interBold,
              fontSize: 24,
            ),
          ),
        ),
        body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
    child: Column(
      children: [
        /// CARD
        CardWidget(
          dbCard: card,
        ),

        SizedBox(height: 30,),
        WhiteOrBlckCardWidget(child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("+ Add Card",style: TextStyle(color: isLightMode(context) ? lightWidgetColorBackground : darkWidgetColorBackground,fontWeight: FontWeight.w800,fontSize: 18),),
            Text("Add Your Debit Card"),
              SizedBox(height: 25,),

              TextFormField(decoration: InputDecoration(hintText: "Card Number"),),
              SizedBox(height: 16,),
              TextFormField(decoration: InputDecoration(hintText: "Card Holder Name"),),
              SizedBox(height: 16,),
              Row(
                children: [
                  Expanded(child: TextFormField(decoration: InputDecoration(hintText: "Expiration Date"),)),
                  SizedBox(width: 12,),
                  Expanded(child: TextFormField(decoration: InputDecoration(hintText: "Security Code"),)),
                ],
              ),
              SizedBox(height: 28,),
              Obx(() => ReusableWidgets().largeAppBtn("Add Card",
                      /// TODO ADD NEW CARD
                      () => null, isLightMode(context) ? lightWidgetColorBackground : darkWidgetColorBackground, Colors.white))
          ],),
        )),
        

      ],
      
    )));
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key, required this.dbCard,
  });

  final DebitCard dbCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(debitCard))
      ),
      child: Stack(children: [
        Positioned(
           left: 26,
            bottom: 100,
            child:
        Text(dbCard.cardNumber,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 22,),) ),
        Positioned(
           left: 26,
            bottom: 40,
            child: Column(
            children: [

          Text("Card Holder Name",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 13,),),
          Text(dbCard.name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 12,),)

          ],
            )

        ),
        Positioned(
           right: 115,
            bottom: 40,
            child: Column(
            children: [

          Text("Expiry Date",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 13,),),
          Text(dbCard.expDate,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 12,),)

          ],
            )

        ),
      ]),
    );
  }
}
