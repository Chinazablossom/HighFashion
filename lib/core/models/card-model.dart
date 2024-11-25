import 'package:uuid/uuid.dart';

const uuid = Uuid();

class DebitCard {
  DebitCard({
    String? id,
    required this.name,
    required this.cardNumber,
    required this.expDate,
    required this.securityCode,
  }) : id = id ?? uuid.v4();

  final String id;
  final String name;
  final String cardNumber;
  final String expDate;
  final String securityCode;

}
