
import 'package:get/get.dart';

class ProductDetailController extends GetxController {

  final Rx<bool> isProductDetailNotExpanded = true.obs;
  final Rx<bool> isReviewDetailNotExpanded = true.obs;
  final Rx<bool> isSelected = true.obs;
  final RxString selectedSize = "".obs;
  final Rx<String> selectedColor = "".obs;
}