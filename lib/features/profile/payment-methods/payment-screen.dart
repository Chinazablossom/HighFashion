import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/core/utils/constanst/colors.dart';
import 'package:high_fashion/features/profile/user-profile/user-profile-screen.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../core/utils/constanst/assetsPaths.dart';
import '../../../core/utils/helper-functions/helper-functions.dart';
import 'add-card-screen.dart';
import 'controllers/payment-controllers.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CardsController cardController = Get.put(CardsController());

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
          "Payment Methods",
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
            //   Text("My Cards",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),)
            GestureDetector(
              onTap: (){
                Get.to(() => AddCardScreen(),
                    transition: Transition.native,
                    duration: const Duration(seconds: 1)
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isLightMode(context) ? lightWidgetColorBackground : darkWidgetColorBackground,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      Icon(Iconsax.card_add_copy),
                      SizedBox(width: 8,),
                      Expanded(flex: 6,child: Text("Add New Card", style: TextStyle(fontWeight: FontWeight.w400),)),
                      Expanded(child: Text("Link", style: TextStyle(fontWeight: FontWeight.w400),)),

                    ],),
                ) ,
              ),
            )

          ],
        ),
      ),
    );
  }
}
