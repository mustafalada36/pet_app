import 'package:flutter/material.dart';

class textHeading extends StatelessWidget {
  final String text;
  final TextStyle textStyle;

  textHeading({required this.text, TextStyle? textStyle})
      : textStyle = textStyle ??
            TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
