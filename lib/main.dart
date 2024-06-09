import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/features/authentication/login/loginScreen.dart';
import 'package:high_fashion/features/authentication/signUp/SignUpScreen.dart';
import 'package:high_fashion/ui/screens/home.dart';
import 'package:high_fashion/ui/screens/welcome_screen.dart';
import 'package:high_fashion/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "High Fashion",
      themeMode: ThemeMode.system,
      darkTheme: highFashionDarkTheme(),
      theme: highFashionLightTheme(),
      home: const SignUpScreen(),
      //initialRoute: '/welcome',
      getPages: [
        GetPage(name: '/welcome', page: () => const WelcomeScreen()),
        GetPage(name: '/home', page: () => const Home()),
      ],
    );
  }
}
