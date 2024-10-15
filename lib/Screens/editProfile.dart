import 'package:flutter/material.dart';
import 'package:pet_app/Reuseable%20Components/customTextField.dart';
import 'package:pet_app/Reuseable%20Components/lineWidget.dart';
import 'package:pet_app/Reuseable%20Components/textHeading.dart';
import 'package:pet_app/constants.dart';

class editProfile extends StatelessWidget {
  const editProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: primaryColor,
            )),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Save",
                style: TextStyle(color: primaryColor, fontSize: 18),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Basic Information",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      color: Color(0xFF267E1E)),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        shape: BoxShape.circle, // Circle shape
                      ),
                      child: Center(
                        child: Icon(
                          Icons.person,
                          color: primaryColor, // Primary color for the icon
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        textHeading(
                          text: "Enter Your Name",
                          textStyle: TextStyle(
                              color: primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        customTextField(
                          width: double.infinity,
                          height: 60,
                          borderRadius: BorderRadius.circular(12),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              textHeading(
                text: "Something About You",
                textStyle: TextStyle(
                    color: primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: customTextField(
                  width: double.infinity,
                  height: 60,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              SizedBox(height: 10),
              textHeading(
                text: "Gender",
                textStyle: TextStyle(
                    color: primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
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
                            border:
                                Border.all(color: primaryColor, width: 2)),
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
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
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
                          "Other",
                          // Hint text converted to display as regular text
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              textHeading(
                text: "Date of Birth",
                textStyle: TextStyle(
                    color: primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: customTextField(
                  width: double.infinity,
                  height: 60,
                  hintText: "DD/MM/YYYY",
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              SizedBox(height: 20),
              lineWidget(),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Contact Information",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      color: Color(0xFF267E1E)),
                ),
              ),
              SizedBox(height: 10),
              textHeading(
                text: "Phone Number",
                textStyle: TextStyle(
                    color: primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: customTextField(
                  width: double.infinity,
                  height: 60,
                  hintText: "+92 0000000000",
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Colors.grey),
                  "This number will be used to contact, reminders,\nand other notifications.",
                ),
              ),
              SizedBox(height: 10),
              textHeading(
                text: "Email",
                textStyle: TextStyle(
                    color: primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: customTextField(
                  width: double.infinity,
                  height: 60,
                  hintText: "abc@gmail.com",
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Colors.grey),
                  "This email will be useful to keep in touch. We won't share your private email address with other PET APP users",
                ),
              ),
              SizedBox(height: 20),
              lineWidget(),
              SizedBox(height: 10),
            ], //main col ===========================================================
          ),
        ),
      ),
    );
  }
}
