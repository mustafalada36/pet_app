import 'package:flutter/material.dart';

import '../constants.dart';

class adsTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      child: Card(
        color: secondaryColor,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 0),
                child: Image.asset("assets/images/rabbitss.png"),
              ),
              const SizedBox(height: 10),
              const Text(
                "Bella",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5, top: 5),
                child: Text(
                  "Rabbit Breed",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5, top: 5),
                child: Text(
                  "Johar Town",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5, top: 5),
                child: Text(
                  "PKR 20,000",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
