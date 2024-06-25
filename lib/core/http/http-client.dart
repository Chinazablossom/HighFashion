import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as https;

class HttpHandler {
  static const _baseUrl = "https://base_url";

  static Future<Map<String, dynamic>> postRequest(String endpoint, dynamic data) async {
    final response = await https.post(Uri.parse("$_baseUrl/$endpoint"),
        headers: {"Content-type": "application/json"}, body: json.encode(data));

    if (response.statusCode >= 400) {
      Get.snackbar(
          "Failed to add item", "An error occurred when trying to add item");
    }

    return _processResponse(response);
  }

  static Future<Map<String, dynamic>> getRequest(String endpoint) async {
    final response = await https.get(Uri.parse("$_baseUrl/$endpoint"));

    if (response.statusCode >= 400) {
      Get.snackbar("Oh no..", "An error occurred.");
    }

    return _processResponse(response);
  }

  static Future<Map<String, dynamic>> putRequest(
      String endpoint, dynamic data) async {
    final response = await https.put(Uri.parse("$_baseUrl/$endpoint"),
        headers: {"Content-type": "application/json"}, body: json.encode(data));

    return _processResponse(response);
  }

  static Future<Map<String, dynamic>> deleteRequest(
      String endpoint, dynamic data) async {
    final response = await https.delete(Uri.parse("$_baseUrl/$endpoint"));

    if (response.statusCode >= 400) {
      Get.snackbar("Failed to delete item",
          "An error occurred when trying to delete item");
    }

    return _processResponse(response);
  }

  static Map<String, dynamic> _processResponse(https.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load data:  ${response.statusCode}");
    }
  }
}
