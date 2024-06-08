
import 'helper-functions.dart';

class Validator {

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Password is required.";
    }

    if (password.length < 6) {
      return "Password must be at least 6 characters long.";
    }

    if (!password.contains(RegExp(r"[A-Z]"))) {
      return "Password must contain at least one uppercase letter.";
    }

    if (!password.contains(RegExp(r"[0-9]"))) {
      return "Password must contain at least one number.";
    }

    if (!password.contains(RegExp(r"[!@#\$%\^&\*\(\)_\+\-\=]"))) {
      return "Password must contain at least one special character.";
    }

    return null;
  }

  static String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return "Phone number is required.";
    }

    final phoneRegex = RegExp(r"^\d{10}$");
    if (!phoneRegex.hasMatch(phoneNumber)) {
      return "Invalid phone number format";
    }

    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Email is required.";
    }

    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (!emailRegex.hasMatch(email)) {
      return "Invalid email address.";
    }

    return null;
  }

  static String? validateName(String? userName) {
    if (userName == null || userName.isEmpty) {
      return "Name is required.";
    }

    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(userName)) {
      return "Name can only contain letters and spaces.";
    }

    return null;
  }

  static String? validateURL(String? url) {
    if (url == null || url.isEmpty) {
      return "URL is required.";
    }

    final urlRegex = RegExp(r"^(http|https):\/\/[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\/?.*$");
    if (!urlRegex.hasMatch(url)) {
      return "Invalid URL format.";
    }

    return null;
  }

  static String? validatePostalCode(String? value, String countryCode) {
    if (value == null || value.isEmpty) {
      return "Postal code is required.";
    }

    final postalCodeRegexes = {
      'US': r"^\d{5}(-\d{4})?$",
      'CA': r"^[A-Za-z]\d[A-Za-z] \d[A-Za-z]\d$",
      'UK': r"^[A-Za-z]{1,2}\d[A-Za-z\d]? \d[A-Za-z]{2}$",
      'DE': r"^\d{5}$",
      'FR': r"^\d{5}$",
      'AU': r"^\d{4}$",
      'IN': r"^\d{6}$",
      'NG': r"^\d{6}$",
    };

    final regexPattern = postalCodeRegexes[countryCode];

    if (regexPattern == null) {
      return "Unsupported country code for postal code validation.";
    }

    final postalCodeRegex = RegExp(regexPattern);

    if (!postalCodeRegex.hasMatch(value)) {
      return "Invalid postal code format.";
    }

    return null;
  }

  static String? validateCreditCardNumber(String? creditCardNumber) {
    if (creditCardNumber == null || creditCardNumber.isEmpty) {
      return "Credit card number is required.";
    }

    final cardNumberRegex = RegExp(r"^\d{16}$");
    if (!cardNumberRegex.hasMatch(creditCardNumber) || !isValidLuhn(creditCardNumber)) {
      return "Invalid credit card number.";
    }

    return null;
  }


}



