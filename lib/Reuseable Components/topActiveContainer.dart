import 'package:flutter/material.dart';

import '../constants.dart';

class topActiveContainer extends StatelessWidget {
  final String title;
  final double width;

  topActiveContainer(this.title, this.width);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(30)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Image.asset("assets/images/activeSymbol.png"),
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
