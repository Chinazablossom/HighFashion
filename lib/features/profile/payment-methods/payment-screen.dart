import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../core/utils/constanst/assetsPaths.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            TextFormField(
              onTap: () {},
              decoration: InputDecoration(
                  label: Row(
                    children: [
                    Icon(Iconsax.card_add_copy),
                    SizedBox(width: 8,),
                    Expanded(flex: 6,child: Text("Add New Card", style: TextStyle(fontWeight: FontWeight.w400),)),
                    Expanded(child: Text("Link", style: TextStyle(fontWeight: FontWeight.w400),)),

                  ],),
              ),)

          ],
        ),
      ),
    );
  }
}
