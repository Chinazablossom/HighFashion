
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/constanst/assetsPaths.dart';
import '../../shared-widgets/sharedWidgets.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: HAppBar(
        centerTiltle: false,
        automaticallyImplyLeading: true,
        title: Text(
          "Payment Methods",
          style: TextStyle(fontFamily: interBold, fontSize: 24,),
        ),
        backArrowVisible: false,
      ),
    );
  }
}
