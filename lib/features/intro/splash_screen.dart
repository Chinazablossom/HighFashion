import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../core/utils/constanst/assetsPaths.dart';
import '../../core/utils/helper-functions/helper-functions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _animationLeftToRight;
  late final Animation<Offset> _animationRightToLeft;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3))..forward();

    _animationLeftToRight = Tween<Offset>(
      begin: const Offset(-1.5, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _animationRightToLeft = Tween<Offset>(
      begin: const Offset(1.5, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    Get.offAllNamed('/welcome');

    // Get.put(SplashController());
  }

/*

  @override
  void initState() {
    Timer(
      const Duration(seconds: 6),
      () {
        //   Get.off();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const WelcomeScreen(),
            ));
      },
    );
    super.initState();
  }

  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..forward();

  late final Animation<Offset> _animationLeftToRight = Tween<Offset>(
    begin: const Offset(-1.5, 0.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

  late final Animation<Offset> _animationRightToLeft = Tween<Offset>(
    begin: const Offset(1.5, 0.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
*/

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/animations/high-fashion-splash.gif"),),
          /*  SlideTransition(
              position: _animationLeftToRight,
              child: Lottie.asset(isLightMode(context) ? appIcon : appIconDark,
                  width: isSmallScreen(context) ? 300 : 200,
                  height: isSmallScreen(context) ? 300 : 200,
                  fit: BoxFit.contain,
                  repeat: true),
            ),
            const SizedBox(
              height: 30,
            ),
            SlideTransition(
                position: _animationRightToLeft,
                child: const Text("High Fashion.",
                    style: TextStyle(
                        fontFamily: rubik,
                        fontWeight: FontWeight.bold,
                        fontSize: 36))),*/
          ],
        ),
      ),
    );
  }
}
