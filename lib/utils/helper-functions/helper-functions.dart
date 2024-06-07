import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

///   FUNCTIONS
extension RangeCheck on num {
  bool inRange(num start, num end) => this >= start && this <= end;
}

bool isLightMode(BuildContext context) {
  return MediaQuery.of(context).platformBrightness == Brightness.light;
}

bool isPortraitMode(BuildContext context) {
  return MediaQuery.of(context).size.width.inRange(300, 600);
}

bool isValidLuhn(String value) {
  int sum = 0;
  bool alternate = false;
  for (int i = value.length - 1; i >= 0; i--) {
    int n = int.parse(value[i]);
    if (alternate) {
      n *= 2;
      if (n > 9) {
        n -= 9;
      }
    }
    sum += n;
    alternate = !alternate;
  }
  return sum % 10 == 0;
}

String getFormattedDate(DateTime date, {String format = "dd-MM-yyyy"}) {
  return DateFormat(format).format(date);
}

double getTotalPrice(double productPrice, String location) {
  double rateOfTax = getTaxRate(location);
  double amountOfTax = productPrice * rateOfTax;

  double costOfShipping = getShippingCost(location);
  double total = productPrice + amountOfTax + costOfShipping;
  return total;
}

String calculateShippingPrice(double productPrice, String location) {
  double shippingCost = getShippingCost(location);
  return shippingCost.toStringAsFixed(2);
}

String calculateTaxPrice(double productPrice, String location) {
  double taxRate = getTaxRate(location);
  double amount = productPrice * taxRate;
  return amount.toStringAsFixed(2);
}

double getTaxRate(String location) {
  return 0.24;
}

double getShippingCost(String location) {
  return 15.00;
}
