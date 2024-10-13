import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {
  final double width;
  final double height;
  final String hintText;
  final TextStyle hintStyle;
  final BorderRadius borderRadius;
  final bool useDefaultDecoration;

  customTextField({
    required this.width,
    required this.height,
    this.hintText = '',
    TextStyle? hintStyle,
    BorderRadius? borderRadius,
    this.useDefaultDecoration = true,
    // Accept hintStyle as optional
  })  : hintStyle = hintStyle ??
            TextStyle(
              // Set a default hintStyle if none is provided
              color: Colors.grey, // Default hint text color
              fontSize: 16, // Default hint text size
            ),
        borderRadius = borderRadius ?? BorderRadius.circular(22);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: TextField(
          decoration: useDefaultDecoration
              ? InputDecoration(
                  hintText: hintText,
                  hintStyle: hintStyle,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: borderRadius,
                    borderSide: BorderSide(
                      color: Color(0xFF267E1E), // Green border color
                      width: 2.0,
                    ),
                  ),
                )
              : InputDecoration(hintText: hintText, hintStyle: hintStyle)),
    );
  }
}
