import 'package:flutter/material.dart';

import '../constants.dart';

class adsTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 170,
        width: double.infinity,
        child: Card(
          color: secondaryColor,
          elevation: 0,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Image.asset("assets/images/rabbitss.png"),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25),
                  Text(
                    "Bella",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 5),
                    child: Text(
                      "Rabbit Breed",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 5),
                    child: Text(
                      "Johar Town",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 5),
                    child: Text(
                      "PKR 20,000",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
