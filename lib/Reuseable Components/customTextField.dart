import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {
  final double width;
  final double height;
  final String hintText;
  final TextStyle hintStyle;
  final BorderRadius borderRadius;
  final bool useDefaultDecoration;
  final bool
      isRequired; // Add isRequired to make the field optional or required

  customTextField({
    required this.width,
    required this.height,
    this.hintText = '',
    TextStyle? hintStyle,
    BorderRadius? borderRadius,
    this.useDefaultDecoration = true,
    this.isRequired = false, // Default to false (not required)
  })  : hintStyle = hintStyle ??
            const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
        borderRadius = borderRadius ?? BorderRadius.circular(22);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: TextFormField(
        validator: isRequired
            ? (value) {
                if (value == null || value.isEmpty) {
                  return 'This field cannot be empty'; // Validation message
                }
                return null; // Valid input
              }
            : null, // No validation if not required
        decoration: useDefaultDecoration
            ? InputDecoration(
                hintText: hintText,
                hintStyle: hintStyle,
                enabledBorder: OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: const BorderSide(
                    color: Color(0xFF267E1E),
                    width: 2.0,
                  ),
                ),
              )
            : InputDecoration(hintText: hintText, hintStyle: hintStyle),
      ),
    );
  }
}
