import 'package:flutter/material.dart';
import 'package:pet_app/Reuseable%20Components/customTextField.dart';

import '../constants.dart';
import 'homeScreen.dart';

class jazzcash extends StatefulWidget {
  @override
  State<jazzcash> createState() => _jazzcashState();
}

class _jazzcashState extends State<jazzcash> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: primaryColor,
            )),
        title: Text(
          "Jazzcash",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 25, color: primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/jazzcash2.png",
                    width: 50,
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: primaryColor.withOpacity(0.5)),
                      "Pay with your JazzCash account.\nPlease make sure you have enough\nbalance in your account.",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: secondaryColor,
              elevation: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      child: Text(
                        "How to Approve?",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: primaryColor),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Login to your Jazzcash account and approve payment request",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: "Note: ",
                                style:
                                    TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                              text:
                                  "Ensure your JazzCash account is active and\nhas sufficient balance. ",
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: customTextField(
                width: double.infinity,
                height: 60,
                hintText: "JazzCash Account Number",
                useDefaultDecoration: false,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value ?? false;
                        });
                      }),
                  Text(
                    'Save your Jazzcash account for future use.',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            SizedBox(height: 80),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: secondaryColor,
              elevation: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            "Subtotal",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: primaryColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            "Rs. 2,000",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: primaryColor),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            "Total Amount",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            "Rs. 2,099",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
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
                          backgroundColor: WidgetStateProperty.all<Color>(
                              const Color(0xFF267E1E)),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Pay Now',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500, // medium weight
                            color: Colors.white, // text color
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(height: 10),
            SizedBox(height: 20),
          ], //main col======================================================
        ),
      ),
    );
  }
}
