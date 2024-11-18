import 'package:flutter/material.dart';

import '../Screens/homeScreen.dart';

class primaryButton extends StatelessWidget {
  final double width;
  final String text;

  primaryButton(this.width, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const homeScreen()),
          );
        },
        style: ButtonStyle(
          backgroundColor:
              WidgetStateProperty.all<Color>(const Color(0xFF267E1E)),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            // medium weight
            color: Colors.white, // text color
          ),
        ),
      ),
    );
  }
}
