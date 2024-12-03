import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pet_app/Screens/signup.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulate a delay before navigating to the home screen
    /*Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const SignUpScreen()),
      );
    });*/

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo Image at the top
            Image.asset(
              'assets/images/LogoContainer.png',
              width: 375,
              height: 213,
            ),
            // Stack containing overlapping circles and a centered image
            SizedBox(
              width: 500,
              height: 570,
              child: Stack(
                children: [
                  // First Circle
                  Positioned(
                    top: 0,
                    left: -198,
                    child: Container(
                      margin: const EdgeInsets.all(30),
                      width: 755.5,
                      height: 621,
                      decoration: BoxDecoration(
                        color: const Color(0xFF31EE21).withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  // Second Circle
                  Positioned(
                    top: 42.25,
                    left: -146.25,
                    child: Container(
                      margin: const EdgeInsets.all(30),
                      width: 652.01,
                      height: 535.93,
                      decoration: BoxDecoration(
                        color: const Color(0xFF31EE21).withOpacity(0.35),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  // Third Circle
                  Positioned(
                    top: 97,
                    left: -77.95,
                    bottom: 10,
                    child: Container(
                      margin: const EdgeInsets.all(30),
                      width: 517.47,
                      height: 449.16,
                      decoration: BoxDecoration(
                        color: const Color(0xFF31EE21).withOpacity(0.55),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  // Centered Image
                  Positioned(
                    top: 94,
                    left: -55,
                    child: Image.asset(
                      'assets/images/pngtree-isolated-cat-on-white-background-png-image_70949271.png',
                      width: 516,
                      height: 449,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
