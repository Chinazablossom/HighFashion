
import 'package:get/get.dart';
import 'package:high_fashion/features/profile/addresses/widget/single-address-widget.dart';

import 'all-addrsses-screen.dart';

class AddressesController extends GetxController {
  static AddressesController get instance => Get.find();

  final RxList<SingleAddress> addressesList = <SingleAddress>[].obs;

}