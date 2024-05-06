import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/LogoContainer.png',
              width: 375,
              height: 213,
            ),
            SizedBox(
              width: 500,
              height: 570,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: -198,
                    // bottom: -80,
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
