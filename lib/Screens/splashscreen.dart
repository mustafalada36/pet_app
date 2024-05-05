import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/LogoContainer.png',
            width: 375,
            height: 213,
          ),
          Image.asset(
            'assets/images/pngtree-isolated-cat-on-white-background-png-image_70949271.png',
            width: 516,
            height: 449,
          ),
        ],
      ),
    );
  }
}
