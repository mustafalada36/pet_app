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
  String selectedValue = "";

  // Define selectedValue to track the selected radio button
  String selectedBillValue = "";
  bool useDifferentAddress = false;

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
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
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
                          "Payment",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 30,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 20),
                        child: Text(
                          "All transactions are secure and encrypted",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.grey),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomRadioButton(
                          value: "COD",
                          groupValue: selectedValue,
                          // Use selectedValue to keep track
                          onChange: (value) {
                            setState(() {
                              selectedValue =
                                  value; // Update selectedValue when radio button is selected
                            });
                          },
                          text: "Cash on Delivery (COD)",
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomRadioButton(
                          value: "card",
                          groupValue: selectedValue,
                          // Use selectedValue to keep track
                          onChange: (value) {
                            setState(() {
                              selectedValue =
                                  value; // Update selectedValue when radio button is selected
                            });
                          },
                          text: "Debit - Credit Card ",
                          imagePaths: [
                            "assets/images/jazzcash.png",
                            "assets/images/masterCard.png",
                            "assets/images/visa.png"
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
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
                          "Billing Address",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 30,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomRadioButton(
                          value: "shipAdd",
                          groupValue: selectedBillValue,
                          // Use selectedValue to keep track
                          onChange: (value) {
                            setState(() {
                              selectedBillValue = value;
                              // Update selectedValue when radio button is selected
                              useDifferentAddress = false;
                            });
                          },
                          text: "Same as Shipping Address",
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomRadioButton(
                          value: "diffAdd",
                          groupValue: selectedBillValue,
                          // Use selectedValue to keep track
                          onChange: (value) {
                            setState(() {
                              selectedBillValue = value;
                              print("value is " + value);
                              useDifferentAddress = true;
                              // Update selectedValue when radio button is selected
                            });
                          },
                          text: "Use a Different Billing Address",
                        ),
                      ),
                      // Conditionally show the TextField based on useDifferentAddress
                      SizedBox(height: 10),
                      if (useDifferentAddress)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: customTextField(
                            width: double.infinity,
                            height: 60,
                            hintText: 'Enter Different Address',
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Text(
                  "Order Summary",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: Colors.black),
                ),
              ),
              SizedBox(height: 180),
            ], //   main Col =========================================================
          ),
        ));
  }
}

//class for radio button
class CustomRadioButton extends StatelessWidget {
  final String value;
  final String groupValue;
  final Function(String) onChange;
  final String text;
  final Color? backgroundColor;

  // Optional list of image paths
  final List<String>? imagePaths;

  CustomRadioButton({
    required this.value,
    required this.groupValue,
    required this.onChange,
    required this.text,
    this.backgroundColor = Colors.white,
    this.imagePaths, // Optional list of images
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChange(value); // Handle on change when tapped
      },
      child: Container(
        decoration: BoxDecoration(
          color: secondaryColor, // Background color for the button
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: primaryColor,
            width: 2,
          ),
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Radio<String>(
              value: value,
              groupValue: groupValue,
              onChanged: (value) {
                if (value != null) {
                  onChange(value); // Trigger the onChange callback
                }
              },
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            Spacer(),
            // Dynamically add images from the list if provided
            if (imagePaths != null)
              Row(
                children: imagePaths!.map((imagePath) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Image.asset(
                      imagePath,
                      width: 30,
                      height: 30,
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }
}
