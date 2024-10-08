import 'package:flutter/material.dart';
import 'package:pet_app/Reuseable%20Components/customDropDownTextField.dart';
import 'package:pet_app/Reuseable%20Components/customTextField.dart';

import '../constants.dart';

class adNewAddress extends StatefulWidget {
  @override
  State<adNewAddress> createState() => _adNewAddressState();
}

class _adNewAddressState extends State<adNewAddress> {
  bool isChecked1 = false;
  bool isChecked2 = false;

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
            "Add New Address",
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
                color: primaryColor),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Contact",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      color: primaryColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: customTextField(
                  width: double.infinity,
                  height: 60,
                  hintText: 'Enter Your Email',
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Email me with news and offers",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: primaryColor.withOpacity(0.5)),
                ),
              ),
              SizedBox(height: 15),
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
                          "Delivery",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 30,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 10),
                      customDropDownButton(
                          width: double.infinity,
                          height: 60,
                          hintText: "   Pakistan",
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: primaryColor),
                          dropdownItems: ["Pakistan", "NA Right Now"]),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: customTextField(
                          width: double.infinity,
                          height: 60,
                          hintText: 'First Name',
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: customTextField(
                          width: double.infinity,
                          height: 60,
                          hintText: 'Last Name',
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: customTextField(
                          width: double.infinity,
                          height: 60,
                          hintText: 'Address',
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: customTextField(
                          width: double.infinity,
                          height: 60,
                          hintText: 'Country/City',
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: customTextField(
                          width: double.infinity,
                          height: 60,
                          hintText: 'Postal Code',
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: customTextField(
                          width: double.infinity,
                          height: 60,
                          hintText: 'Phone',
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: [
                            Checkbox(
                                value: isChecked1,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked1 = value ?? false;
                                  });
                                }),
                            Text('Save this Information')
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          children: [
                            Checkbox(
                                value: isChecked2,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked2 = value ?? false;
                                  });
                                }),
                            Text('Text me with news offers')
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0x5e99f1f1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "Free Shipping Across \n Pakistan",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "Free",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ], //   main Col =========================================================
          ),
        ));
  }
}
