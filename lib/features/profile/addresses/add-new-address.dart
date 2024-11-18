import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:high_fashion/core/utils/constanst/colors.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../core/utils/constanst/assetsPaths.dart';
import '../../../core/utils/helper-functions/helper-functions.dart';
import '../../shared-widgets/sharedWidgets.dart';

class AddNewAddressesScreen extends StatelessWidget {
  const AddNewAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isLightMode(context) ? const Color(0xfff7f9fa) : darkBackground,
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Text(
          "Create New Address",
          style: TextStyle(fontFamily: interBold, fontSize: 22),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              CupertinoIcons.back,
              size: 30,
            )),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          color: isLightMode(context)
                              ? Colors.black54
                              : Colors.white.withOpacity(0.3),
                          blurRadius: 2.0,
                          spreadRadius: 1,
                          blurStyle: BlurStyle.outer)
                    ],
                    color: isLightMode(context)
                        ? Colors.white
                        : Colors.black.withOpacity(0.4)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Contact Information",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.user_copy),
                            labelText: "Full Name"),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.mobile_copy),
                            labelText: "Phone Number"),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          color: isLightMode(context)
                              ? Colors.black54
                              : Colors.white.withOpacity(0.3),
                          blurRadius: 2.0,
                          spreadRadius: 1,
                          blurStyle: BlurStyle.outer)
                    ],
                    color: isLightMode(context)
                        ? Colors.white
                        : Colors.black.withOpacity(0.4)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Address Information",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.home_copy),
                            labelText: "Street, house/apartment/unit"),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Iconsax.hashtag_down_copy),
                                  labelText: "Postal Code"),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Iconsax.buildings_2_copy),
                                  labelText: "City"),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Iconsax.global_copy),
                                  labelText: "Country"),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Iconsax.map_copy),
                                  labelText: "State"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ReusableWidgets().largeAppBtn(
                  "Add New Shipping Address",
                  (){
                    // TODO: ADD NEW ADDRESS
                  },
                  isLightMode(context)
                      ? lightWidgetColorBackground
                      : darkWidgetColorBackground,
                  Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}
