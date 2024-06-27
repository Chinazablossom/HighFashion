import 'package:flutter/material.dart';
import 'package:high_fashion/core/utils/constanst/assetsPaths.dart';

import '../utils/constanst/colors.dart';

///   LIGHT THEME
ThemeData highFashionLightTheme() {
  return ThemeData.light(
    useMaterial3: true,
  ).copyWith(
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        actionsIconTheme: const IconThemeData(color: Colors.black, size: 27),
        iconTheme: const IconThemeData(color: lightWidgetColorBackground ),
        titleTextStyle: const TextStyle(
            fontSize: 20,
            fontFamily: interBold,
            fontWeight: FontWeight.w600,
            color: Colors.black),
      ),



      cardTheme: const CardTheme().copyWith(
        color: const Color(0xfff4f3fd),
        surfaceTintColor: Colors.white70,
        shadowColor: Colors.black,
      ),
      bottomSheetTheme: const BottomSheetThemeData().copyWith(
        backgroundColor: Colors.black,
        modalBackgroundColor: const Color(0xfff1f3f5),
        showDragHandle: true,
        dragHandleColor: Colors.black,
        dragHandleSize: const Size(100, 6),
        constraints: const BoxConstraints(minWidth: double.infinity),
      ),
      checkboxTheme: const CheckboxThemeData().copyWith(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          checkColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.white;
            } else {
              return Colors.black;
            }
          }),
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return lightWidgetColorBackground;
            } else {
              return Colors.transparent;
            }
          })),
      chipTheme: const ChipThemeData().copyWith(
          disabledColor: Colors.grey,
          labelStyle: const TextStyle(color: Colors.black),
          selectedColor: lightWidgetColorBackground,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          checkmarkColor: Colors.white),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 3,
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
              disabledBackgroundColor: Colors.grey,
              disabledForegroundColor: Colors.grey,
              side: const BorderSide(
                  color: lightWidgetColorBackground, strokeAlign: 2),
              textStyle: const TextStyle(
                  fontFamily: "InterBold",
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600))),
      textTheme: const TextTheme().copyWith(
        headlineLarge: const TextStyle().copyWith(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        headlineMedium: const TextStyle().copyWith(
            fontSize: 28, fontWeight: FontWeight.w600, color: Colors.black),
        headlineSmall: const TextStyle().copyWith(
            fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),
        bodyLarge: const TextStyle().copyWith(
            fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
        bodyMedium:
            const TextStyle().copyWith(fontSize: 16, color: Colors.black),
        bodySmall: const TextStyle().copyWith(
            fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
        titleLarge: const TextStyle().copyWith(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        titleMedium: const TextStyle().copyWith(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
        titleSmall: const TextStyle().copyWith(
            fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
        labelLarge: const TextStyle().copyWith(
            fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black),
        labelMedium: const TextStyle().copyWith(
            fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
        labelSmall: const TextStyle().copyWith(
            fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
      ),
      inputDecorationTheme: const InputDecorationTheme().copyWith(
        prefixIconColor: Colors.black,
        suffixIconColor: Colors.black,
        labelStyle: const TextStyle().copyWith(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal),
        hintStyle:
            const TextStyle().copyWith(fontSize: 14, color: Colors.black),
        floatingLabelStyle: const TextStyle()
            .copyWith(fontSize: 12, color: Colors.black.withOpacity(0.8)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.grey, width: 1)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.black, width: 1)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
                color: lightWidgetColorBackground, width: 1.8)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.red, width: 1)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.redAccent, width: 1)),
        errorMaxLines: 3,
      ));
}

///   DARK THEME
ThemeData highFashionDarkTheme() {
  return ThemeData.dark(useMaterial3: true).copyWith(
      scaffoldBackgroundColor: Colors.black,

      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        actionsIconTheme: const IconThemeData(color: Colors.white, size: 27),
        iconTheme: const IconThemeData(color: darkWidgetColorBackground),
        titleTextStyle: const TextStyle(
            fontSize: 18,
            fontFamily: "InterBold",
            fontWeight: FontWeight.w600,
            color: Colors.white),
      ),
      cardTheme: const CardTheme().copyWith(
        color: Colors.black,
        surfaceTintColor: Colors.black,
      ),
      chipTheme: const ChipThemeData().copyWith(
          disabledColor: Colors.grey,
          labelStyle: const TextStyle(color: Colors.white),
          selectedColor: darkWidgetColorBackground,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          checkmarkColor: Colors.white),
      bottomSheetTheme: const BottomSheetThemeData().copyWith(
        backgroundColor: Colors.white,
        modalBackgroundColor: const Color(0xfff1f3f5),
        showDragHandle: true,
        dragHandleColor: Colors.black,
        dragHandleSize: const Size(100, 6),
        constraints: const BoxConstraints(minWidth: double.infinity),
      ),
      checkboxTheme: const CheckboxThemeData().copyWith(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          checkColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.white;
            } else {
              return Colors.white;
            }
          }),
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return darkWidgetColorBackground;
            } else {
              return Colors.transparent;
            }
          })),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 3,
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              disabledBackgroundColor: Colors.grey,
              disabledForegroundColor: Colors.grey,
              side: const BorderSide(
                  color: darkWidgetColorBackground, strokeAlign: 2),
              textStyle: const TextStyle(
                  fontFamily: "InterBold",
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600))),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.white, foregroundColor: Colors.black),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.white70)),
      textTheme: const TextTheme().copyWith(
        headlineLarge: const TextStyle().copyWith(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        headlineMedium: const TextStyle().copyWith(
            fontSize: 28, fontWeight: FontWeight.w600, color: Colors.white),
        headlineSmall: const TextStyle().copyWith(
            fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
        bodyLarge: const TextStyle().copyWith(
            fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
        bodyMedium:
            const TextStyle().copyWith(fontSize: 16, color: Colors.white),
        bodySmall: const TextStyle().copyWith(
            fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
        titleLarge: const TextStyle().copyWith(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        titleMedium: const TextStyle().copyWith(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        titleSmall: const TextStyle().copyWith(
            fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
        labelLarge: const TextStyle().copyWith(
            fontSize: 15, fontWeight: FontWeight.normal, color: Colors.white),
        labelMedium: const TextStyle().copyWith(
            fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
        labelSmall: const TextStyle().copyWith(
            fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white),
      ),
      inputDecorationTheme: const InputDecorationTheme().copyWith(
        prefixIconColor: Colors.white,
        suffixIconColor: Colors.white,
        labelStyle: const TextStyle().copyWith(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.normal),
        hintStyle:
            const TextStyle().copyWith(fontSize: 14, color: Colors.white),
        floatingLabelStyle: const TextStyle()
            .copyWith(fontSize: 12, color: Colors.white.withOpacity(0.8)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.grey, width: 1)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.grey, width: 1)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                const BorderSide(color: darkWidgetColorBackground, width: 1.5)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.red, width: 1)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.redAccent, width: 1)),
        errorMaxLines: 3,
      ));
}
