import 'package:flutter/material.dart';
import 'package:pet_app/Reuseable%20Components/customDropDownTextField.dart';
import 'package:pet_app/Reuseable%20Components/customTextField.dart';
import 'package:pet_app/Reuseable%20Components/lineWidget.dart';
import 'package:pet_app/Reuseable%20Components/textHeading.dart';
import 'package:pet_app/constants.dart';

import 'homeScreen.dart';

class adDetails extends StatefulWidget {
  @override
  State<adDetails> createState() => _adDetailsState();
}

class _adDetailsState extends State<adDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x2931EE21),
        leading: IconButton(
          color: Color(0xFF267E1E),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Include Some Details",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 25,
              color: Color(0xFF267E1E)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //===========================================main col

            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                color: Color(0x2931EE21),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "UPLOAD UPTO 5 IMAGES",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Color(0xFF267E1E)),
                    ),
                    SizedBox(width: 15),
                    IconButton(
                      color: Color(0xFF267E1E),
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),

            GestureDetector(
              child: CircleAvatar(
                backgroundColor: secondaryColor,
                radius: 70,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Image.asset("assets/images/camera.png"),
                    SizedBox(height: 15),
                    Text(
                      'Add Images',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    )
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            textHeading(text: "Categories *"),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CircleAvatar(
                    backgroundColor: Color(0x2931EE21),
                    radius: 30,
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Image.asset(
                          "assets/images/loginimg.png",
                          height: 25,
                          width: 25,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
                Text(
                  "Animals",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Color(0xFF267E1E),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),

            lineWidget(),
            SizedBox(height: 15),

            textHeading(text: "Price *"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: customTextField(
                width: double.infinity,
                height: 60,
              ),
            ),
            SizedBox(height: 15),
            lineWidget(),
            SizedBox(height: 15),
            textHeading(text: "Breed *"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "None",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color(0xFF267E1E),
                  ),
                )
              ],
            ),
            SizedBox(height: 15),
            lineWidget(),
            SizedBox(height: 15),
            textHeading(text: "Sex *"),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 80,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: primaryColor, width: 2)),
                      child: Center(
                        child: Text(
                          "Male",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: 100, // Width from the original customTextField
                    height: 50, // Height from the original customTextField
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: primaryColor, width: 2),
                    ),
                    child: Center(
                      child: Text(
                        "Female",
                        // Hint text converted to display as regular text
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: 80, // Width from the original customTextField
                    height: 50, // Height from the original customTextField
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: primaryColor, width: 2),
                    ),
                    child: Center(
                      child: Text(
                        "Cross",
                        // Hint text converted to display as regular text
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            lineWidget(),
            SizedBox(height: 15),
            textHeading(text: "Age *"),
            SizedBox(height: 10),
            Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: customDropDownButton(
                    width: 120,
                    height: 60,
                    hintText: "Age",
                    dropdownItems: [
                      "NA",
                      "New Born",
                      "3 months",
                      "6 months",
                      "9 months",
                      "1 year old",
                      "2 year old",
                      "3 year old",
                      "4 year old",
                      "5 year old",
                      "More than 5 years old"
                    ])),
            SizedBox(height: 10),

            lineWidget(),
            SizedBox(height: 15),
            textHeading(text: "Vaccinated *"),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: 80, // Width from the original customTextField
                    height: 50, // Height from the original customTextField
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: primaryColor, width: 2),
                    ),
                    child: Center(
                      child: Text(
                        "Yes",
                        // Hint text converted to display as regular text
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: 80,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: primaryColor, width: 2),
                    ),
                    child: Center(
                      child: Text(
                        "No",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 15),
            lineWidget(),

            SizedBox(height: 10),

            //tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt
            textHeading(text: "Location *"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Choose",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Color(0xFF267E1E),
                  ),
                )
              ],
            ),
            SizedBox(height: 15),
            lineWidget(),
            SizedBox(height: 15),
            textHeading(
              text: "Ad Title *",
              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: customTextField(
                width: double.infinity,
                height: 60,
              ),
            ),
            SizedBox(height: 15),
            lineWidget(),
            SizedBox(height: 15),

            textHeading(
              text: "Description *",
              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: customTextField(
                width: double.infinity,
                height: 60,
              ),
            ),
            SizedBox(height: 15),
            lineWidget(),
            SizedBox(height: 15),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const homeScreen()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(const Color(0xFF267E1E)),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500, // medium weight
                    color: Colors.white, // text color
                  ),
                ),
              ),
            ),
          ], //=================================================main col
        ),
      ),
    );
  }
}
