import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_fashion/features/authentication/ui/loginScreen.dart';
import 'package:high_fashion/features/authentication/verification/email/email-verification-screen.dart';
import 'package:high_fashion/features/home/screens/home-page-screen.dart';
import 'package:high_fashion/features/home/screens/home.dart';
import 'package:high_fashion/features/home/screens/welcome_screen.dart';

import 'core/theme/theme.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: const Home(),

    );
  }
}
