import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/core/utils/constanst/colors.dart';
import 'package:high_fashion/features/shared-widgets/sharedWidgets.dart';

import '../../core/utils/constanst/assetsPaths.dart';
import '../../core/utils/helper-functions/helper-functions.dart';
import 'controller/address-search-controller.dart';

class EnterLocationScreen extends StatelessWidget {
  const EnterLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddressSearchController addressSearchController =
        Get.put(AddressSearchController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Text(
          "Enter your Location",
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
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ReusableWidgets().buildSearchBar(null,(value) {
              addressSearchController.searchAddress(value);
            }, isLightMode(context)),
            SizedBox(height: 16,),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: addressSearchController.suggestions.length,
                  itemBuilder: (context, index) {
                    final suggestion = addressSearchController.suggestions[index];
                    return ListTile(
                      contentPadding: EdgeInsets.all(4),
                      title: Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            boxShadow: [
                              BoxShadow(
                                  color: isLightMode(context)
                                      ? Colors.black54
                                      : Colors.white.withOpacity(0.3),
                                  blurRadius: 2.0,
                                  spreadRadius: 2,
                                  blurStyle: BlurStyle.outer)
                            ],
                            color: isLightMode(context)
                                ? Colors.white
                                : Colors.black.withOpacity(0.4)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8,bottom: 8,right: 2),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.5,left: 2),
                                  child: Icon(CupertinoIcons.location_solid,size: 18,color: isLightMode(context) ? lightWidgetColorBackground : darkWidgetColorBackground,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 22),
                                  child: Expanded(
                                    child: Text(
                                      suggestion["display_name"],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      onTap: () {
                        // TODO SAVE USER LOCATION
                      },
                    );
                  },
                );
              }),
            ),

          ],
        ),
      ),
    );
  }
}
