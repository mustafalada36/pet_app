import 'package:flutter/material.dart';
import 'package:pet_app/Reuseable%20Components/adsTemplate.dart';
import 'package:pet_app/Reuseable%20Components/topContainer.dart';

import '../constants.dart';

class buyDog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Pets',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: primaryColor,
            )),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              topContainer(
                "Dogs",
                110,
                image: Image.asset("assets/images/activeSymbol.png"),
                clr: primaryColor,
                textClr: Colors.white,
              ),
              topContainer(
                "Johar Town",
                160,
                clr: secondaryColor,
                textClr: primaryColor,
              )
            ],
          ),
          SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: "Showing: ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: "Results for See All Pets",
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text("Sort By",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationZ(1.5708),
                          // Rotate around Y-axis by 180 degrees (π radians)
                          child: Icon(Icons.compare_arrows),
                        )
                      ],
                    ),
                  )
                ],
              )),
          SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [adsTemplate(), adsTemplate()],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [adsTemplate(), adsTemplate()],
                  ),
                ],
              )),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
