
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/features/authentication/verification/otp/otp-ui.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../ui/widgets/reuseableWidgets.dart';
import '../../../../utils/constanst/assetsPaths.dart';
import '../../../../utils/helper-functions/helper-functions.dart';
import '../loginScreen.dart';

class ForgotMailScreen extends StatelessWidget {
  const ForgotMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.offAll(const LoginScreen());
        }, icon: const Icon(Icons.arrow_back_ios,size: 25,)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Reset Your Password",style: TextStyle(fontFamily: interBlack ,fontSize: 32)),
                  const SizedBox(height: 4,),
                  const Text("Enter your email address below to receive a One-Time Password to reset your password.",
                      style: TextStyle(fontSize: 15,fontFamily: interRegular) ),
                  const SizedBox(height: 40,),

                  TextFormField(
                    decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sms_copy)),
                  ),

                  const SizedBox(height: 35,),
                  ReuseableWidgets().largeAppBtn(isLightMode(context), "Next", (){

                    OTPBottomSheet().buildShowModalBottomSheet(context,"email");
                  })

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
