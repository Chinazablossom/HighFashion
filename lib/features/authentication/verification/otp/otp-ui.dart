
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:high_fashion/ui/widgets/reuseableWidgets.dart';
import 'package:high_fashion/utils/constanst/assetsPaths.dart';
import 'package:high_fashion/utils/helper-functions/helper-functions.dart';

class OTPBottomSheet{

  var otp;
  Future<dynamic> buildShowModalBottomSheet(BuildContext context,String key) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                height: 125,
                  image:  key == "email"
                  ?  const AssetImage(otpSentToEmailAnimation)
                  : const AssetImage(otpSentToPhoneAnimation)),

              const SizedBox(
                height: 20,
              ),
               Text("Enter the 6 digit OTP",
                  style: TextStyle(
                      fontSize: 27,fontFamily: interExtraBold,
                      color: isLightMode(context) ? Colors.white : Colors.black

                  )

              ),

              const SizedBox(
                height: 30,
              ),

              OtpTextField(
                fieldWidth: 45,
                keyboardType: TextInputType.number,
                numberOfFields: 6,
                fillColor: isLightMode(context) ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
                filled: true,
                textStyle: TextStyle(
                  fontFamily: interBlack,
                    color: isLightMode(context) ? Colors.white : Colors.black
                ),
                onSubmit: (code) {
               //   otp = code;
                //  OTPController.instance.verifyOTPForgotPassword(otp);
                },
              ),
              const SizedBox(height: 30,),

              //  VERIFICATION BTN
              ReuseableWidgets().largeAppBtn(isLightMode(context), "Verify", () => null),


            ],
          ),
        ),
      ),
    );
  }

}