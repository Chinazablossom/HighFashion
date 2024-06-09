
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/features/authentication/login/loginScreen.dart';
import 'package:high_fashion/features/authentication/verification/otp/otp-ui.dart';
import 'package:high_fashion/ui/widgets/reuseableWidgets.dart';
import 'package:high_fashion/utils/constanst/assetsPaths.dart';
import 'package:high_fashion/utils/helper-functions/helper-functions.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ForgotPhoneScreen extends StatelessWidget {
  const ForgotPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                const Text("Enter your Phone number below to receive a One-Time Password to reset your password.",
                    style: TextStyle(fontSize: 15,fontFamily: interRegular) ),
                const SizedBox(height: 40,),

                TextFormField(
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.call_copy)),
                ),

                const SizedBox(height: 30,),
                ReuseableWidgets().largeAppBtn(isLightMode(context), "Next", (){
                  OTPBottomSheet().buildShowModalBottomSheet(context, "phone");
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
