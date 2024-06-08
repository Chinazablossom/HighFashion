import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/ui/widgets/common.dart';
import 'package:high_fashion/utils/constanst/assetsPaths.dart';
import 'package:high_fashion/utils/constanst/colors.dart';
import 'package:high_fashion/utils/helper-functions/helper-functions.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Login",
                  style: TextStyle(
                    fontFamily: interExtraBold,
                    fontSize: 34,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Hi, Welcome back we've missed you!",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.sms_copy),
                    labelText: "Email",
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.key_copy),
                    suffixIcon: Icon(Iconsax.eye_slash),
                    labelText: "Password",
                  ),
                  obscureText: true,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (value) {},
                          ),
                          const Text("Remember me")
                        ],
                      ),
                    ),
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: isLightMode(context)
                              ? lightWidgetColorBackground
                              : darkWidgetColorBackground),
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                largeAppBtn(
                  isLightMode(context),
                  "Login",
                  () {},
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Divider(
                        color: Colors.grey.shade700,
                        indent: 50,
                        endIndent: 5,
                      ),
                    ),
                    Text(
                      "or login with",
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    Flexible(
                      child: Divider(
                        color: Colors.grey.shade700,
                        indent: 5,
                        endIndent: 55,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Image(
                            height: 55, image: AssetImage(googleIcon)),
                      ),
                    ),
                    Flexible(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Image(
                            height: 55, image: AssetImage(faceBookIcon)),
                      ),
                    ),
                    Flexible(
                      child: IconButton(
                        onPressed: () {
                          Get.snackbar("Apple Login", "Coming Soon...",
                              backgroundColor: isLightMode(context)
                                  ? Colors.white
                                  : Colors.white30,
                              duration: const Duration(seconds: 5));
                        },
                        icon: Image(
                          height: 50,
                          image: AssetImage(
                              isLightMode(context) ? appleIcon : appleIconDark),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
