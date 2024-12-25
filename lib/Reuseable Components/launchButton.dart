import 'package:flutter/material.dart';

import '../constants.dart'; // Adjust the path to your constants file

class LaunchButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const LaunchButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 56,
              height: 43,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Icon(
                icon,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
