import 'package:intl/intl.dart';

String formatPhoneNumber(String number) {
  if (number.length == 11) {
    return "(${number.substring(0, 4)}) ${number.substring(4, 7)} ${number.substring(7)}";
  } else if (number.length == 10) {
    return "(${number.substring(0, 3)}) ${number.substring(3, 6)} ${number.substring(6)}";
  }

  return number;
}

String formatDate(DateTime? date) {
  date ??= DateTime.now();
  return DateFormat("dd-MM-yyyy").format(date);
}

String formatToUSD(double amount) {
  return NumberFormat.currency(locale: "en_US", symbol: "\$").format(amount);
}

String formatToEuro(double amount) {
  return NumberFormat.currency(locale: "de_DE", symbol: "€").format(amount);
}

String formatToNaira(double amount) {
  return NumberFormat.currency(locale: "en_NG", symbol: "₦").format(amount);
}

String formatToPounds(double amount) {
  return NumberFormat.currency(locale: "en_GB", symbol: "£").format(amount);
}
