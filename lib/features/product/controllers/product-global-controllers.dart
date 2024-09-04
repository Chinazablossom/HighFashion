

import 'package:get/get.dart';

import '../../../core/models/product_model.dart';

class GlobalController extends GetxController {
  static GlobalController get instance => Get.find();

  var favorites = <Product>[].obs;
  var cart = <Product>[].obs;

  void addToFavorites(Product product) {
    if (!favorites.any((p) => p.id == product.id)) {
      favorites.add(product);
    }
  }

  void removeFromFavorites(Product product) {
    favorites.removeWhere((p) => p.id == product.id);
  }

  bool isFavorite(Product product) {
    return favorites.any((p) => p.id == product.id);
  }

  void addToCart(Product product) {
    if (!cart.any((p) => p.id == product.id)) {
      cart.add(product);
    }
  }

  void removeFromCart(Product product) {
    cart.removeWhere((p) => p.id == product.id);
  }

  bool isInCart(Product product) {
    return cart.any((p) => p.id == product.id);
  }

}