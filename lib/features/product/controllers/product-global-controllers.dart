

import 'package:get/get.dart';

import '../../../core/models/product_model.dart';

class GlobalController extends GetxController {
  static GlobalController get instance => Get.find();

  var favorites = <Product>[].obs;
  final RxList<Product> cart = <Product>[].obs;
  var productQuantities = <String, int>{}.obs;


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

    if (productQuantities.containsKey(product.id)) {
      productQuantities[product.id] = productQuantities[product.id]! + 1;
    } else {
      productQuantities[product.id] = 1;
    }
  }

  void removeFromCart(Product product) {
    cart.removeWhere((p) => p.id == product.id);
    productQuantities.remove(product.id);

  }


  bool isInCart(Product product) {
    return cart.any((p) => p.id == product.id);
  }

  void increaseQuantity(Product product) {
    if (productQuantities.containsKey(product.id)) {
      productQuantities[product.id] = productQuantities[product.id]! + 1;
    }
  }

  void decreaseQuantity(Product product) {
    if (productQuantities.containsKey(product.id) && productQuantities[product.id]! > 1) {
      productQuantities[product.id] = productQuantities[product.id]! - 1;
    }
  }

  int getQuantity(Product product) {
    return productQuantities[product.id] ?? 1;
  }

  double calculateTotalPrice(Product product) {
    return product.price * (productQuantities[product.id] ?? 1);
  }

}