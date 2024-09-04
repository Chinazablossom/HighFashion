import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddressSearchController extends GetxController {
  static AddressSearchController get instance => Get.find();

  var suggestions = [].obs;

  void searchAddress(String query) async {
    final url = Uri.parse('https://nominatim.openstreetmap.org/search?q=$query&format=json&addressdetails=1');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      suggestions.value = json.decode(response.body);
    }
  }
}
