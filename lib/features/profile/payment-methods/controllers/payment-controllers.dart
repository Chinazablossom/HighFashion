
import 'package:get/get.dart';
import 'package:high_fashion/core/models/card-model.dart';

class CardsController extends GetxController {
  static CardsController get instance => Get.find();

  final RxList<DebitCard> dbCardsList = <DebitCard>[].obs;
  var cardQuantities = <String, int>{}.obs;

  void addToList(DebitCard card) {
    if (!dbCardsList.any((p) => p.id == card.id)) {
      dbCardsList.add(card);
    }

    if (cardQuantities.containsKey(card.id)) {
      cardQuantities[card.id] = cardQuantities[card.id]! + 1;
    } else {
      cardQuantities[card.id] = 1;
    }
  }

  void removeFromList(DebitCard card) {
    dbCardsList.removeWhere((c) => c.id == card.id);
    cardQuantities.remove(card.id);
  }

  bool isInCart(DebitCard debitCard) {
    return dbCardsList.any((c) => c.id == debitCard.id);
  }

}