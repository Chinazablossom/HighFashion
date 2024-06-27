import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Product {
  Product({
    String? id,
    required this.name,
    required this.image,
    required this.price,
  }) : id = id ?? uuid.v4();

  final String id;
  final String name;
  final String image;
  final double price;

}
