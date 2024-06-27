import 'package:flutter/material.dart';


import '../../../../core/utils/constanst/assetsPaths.dart';
import '../../../../core/utils/helper-functions/helper-functions.dart';
import '../../../shared-widgets/sharedWidgets.dart';

class EmailSuccessSheet {
  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage(emailVerifiedAnimation),
                      fit: BoxFit.contain,
                      height: 100,
                    ),
                    const Text("Email Successfully Verified!",
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: interExtraBold,
                            color: Colors.black)),
                    const Text(
                        "Congratulations! Your email address has been successfully verified.You can now enjoy full access to High Fashion's features and explore the latest fashion trends.",
                        style: TextStyle(
                            fontSize: 14,
                            color:Colors.black),
                        textAlign: TextAlign.center),
                    const SizedBox(
                      height: 20,
                    ),
                    ReuseableWidgets().largeAppBtn(
                        isLightMode(context), "Start Shopping", () => null)
                  ],
                ),
              ),
            ));
  }
}
