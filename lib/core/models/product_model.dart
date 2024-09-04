import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Product {
  Product({
    String? id,
    required this.sizes,
    required this.name,
    required this.image,
    required this.price,
    required this.detail,
  }) : id = id ?? uuid.v4();

  final String id;
  final String name;
  final String image;
  final String detail;
  final List<String>? sizes;
  final double price;

}
