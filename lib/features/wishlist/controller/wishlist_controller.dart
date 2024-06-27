import 'package:get/get.dart';

import '../../../core/models/product_model.dart';

class FavoritesController extends GetxController {
  RxList<Product> favorites = RxList<Product>();


  void addToFavorites(Product product) {
    if (!favorites.any((productInList) => productInList.id == product.id)) {
      favorites.add(product);
    }
  }

  bool isFavorite(Product product) {
    return favorites.any((productInList) => productInList.id == product.id);
  }

  void removeFromFavorites(Product product) {
    favorites.removeWhere((productInList) => productInList.id == product.id);
  }
}
