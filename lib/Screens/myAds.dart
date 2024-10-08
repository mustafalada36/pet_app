import 'package:flutter/material.dart';
import 'package:pet_app/Reuseable%20Components/topActiveContainer.dart';
import 'package:pet_app/Screens/favourites.dart';
import 'package:pet_app/constants.dart';

class myAds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "My Ads",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: primaryColor),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              topActiveContainer("Ads", 120),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CircleAvatar(
                  backgroundColor: primaryColor,
                  child: Text(
                    "1",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          adsCard(), // From Favourites Screen
        ],
      ),
    );
  }
}
