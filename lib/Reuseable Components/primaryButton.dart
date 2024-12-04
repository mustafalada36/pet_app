import 'package:flutter/material.dart';

import '../Screens/homeScreen.dart';

class primaryButton extends StatefulWidget {
  final double width;
  final String text;
  void Function()? onPressed;

  primaryButton(this.width, this.text, this.onPressed);

  @override
  State<primaryButton> createState() => _primaryButtonState();
}

class _primaryButtonState extends State<primaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: ElevatedButton(
        onPressed: widget.onPressed,
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
          widget.text,
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
