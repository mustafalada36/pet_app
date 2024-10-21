import 'package:flutter/material.dart';

class adDescription extends StatelessWidget {
  const adDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                "assets/images/cat2.png",
                fit: BoxFit.fitWidth,
                height: 150,
              ),
            ),
            Expanded(
                child: Container(
              color: Colors.red,
            )),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
