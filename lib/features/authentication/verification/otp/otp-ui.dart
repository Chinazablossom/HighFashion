import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';


import '../../../../core/utils/constanst/assetsPaths.dart';
import '../../../../core/utils/helper-functions/helper-functions.dart';
import '../../../shared-widgets/sharedWidgets.dart';

class OTPBottomSheet {
  var otp;

  Future<dynamic> buildShowModalBottomSheet(BuildContext context, String key) {
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
                  height: 100,
                  image: key == "email"
                      ? const AssetImage(otpSentToEmailAnimation)
                      : const AssetImage(otpSentToPhoneAnimation)),

              const SizedBox(
                height: 20,
              ),
              const Text("Enter the 6 digit OTP",
                  style: TextStyle(
                      fontSize: 27,
                      fontFamily: interExtraBold,
                      color: Colors.black)),

              const SizedBox(
                height: 30,
              ),

              OtpTextField(
                fieldWidth: 45,
                keyboardType: TextInputType.number,
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.3),
                filled: true,
                textStyle: const TextStyle(
                    fontFamily: interBlack, color: Colors.black),
                onSubmit: (code) {},
              ),
              const SizedBox(
                height: 30,
              ),

              //  VERIFICATION BTN
              ReuseableWidgets()
                  .largeAppBtn(isLightMode(context), "Verify", () => null),
            ],
          ),
        ),
      ),
    );
  }
}
