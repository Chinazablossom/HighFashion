import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            onTap: () {
              Navigator.pop(context);
            },
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
    );
  }
}
