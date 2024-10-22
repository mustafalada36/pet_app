import 'package:flutter/material.dart';
import 'package:pet_app/constants.dart';
import '../Screens/homeScreen.dart';

class secondaryButton extends StatelessWidget {
  final double width;
  final String text;

  secondaryButton(this.width, this.text);

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
          backgroundColor: WidgetStateProperty.all<Color>(secondaryColor),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            // medium weight
            color: primaryColor, // text color
          ),
        ),
      ),
    );
  }
}
