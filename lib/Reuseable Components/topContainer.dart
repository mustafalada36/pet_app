import 'package:flutter/material.dart';

import '../constants.dart';

class topContainer extends StatelessWidget {
  final String title;
  final double width;
  final Color? clr;
  final Color? textClr;
  final Image? image;

  topContainer(this.title, this.width, {this.clr, this.image, this.textClr});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: width,
        height: 50,
        decoration: BoxDecoration(
          color: clr,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: image, //Image.asset("assets/images/activeSymbol.png")
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w700, color: textClr),
            ),
          ],
        ),
      ),
    );
  }
}
