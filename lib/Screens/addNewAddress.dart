import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/Reuseable%20Components/customDropDownTextField.dart';
import 'package:pet_app/Reuseable%20Components/customTextField.dart';
import 'package:pet_app/Reuseable%20Components/primaryButton.dart';
import 'package:pet_app/Screens/cashonDelivery.dart';
import 'package:pet_app/Screens/creditndebit.dart';

import '../Other Services/stripe_services.dart';
import '../constants.dart';

class addNewAddress extends StatefulWidget {
  final String name;
  final String firstImage;
  final String species;
  final String location;
  final String price;
  final String sellerId;

  addNewAddress({
    required this.name,
    required this.firstImage,
    required this.species,
    required this.location,
    required this.price,
    required this.sellerId,
  });

  @override
  State<addNewAddress> createState() => _adNewAddressState();
}

class _adNewAddressState extends State<addNewAddress> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  String country = " ";
  String selectedPayment = "";
  String selectedBillValue = "";
  bool useDifferentAddress = false;

  final _formKey = GlobalKey<FormState>();

  final String? userId = FirebaseAuth.instance.currentUser?.uid;

  void addNewAddress() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    await firestore.collection('Address').add({
      'userId': userId,
      'email': emailController.text,
      'country': country,
      'fName': fNameController.text,
      'lName': lNameController.text,
      'address': addressController.text,
      'city': cityController.text,
      'postalCode': postalCodeController.text,
      'phone': phoneController.text,
      'payment': selectedPayment,
      'billing': selectedBillValue,
      'saveInfo': isChecked1,
      'newsOffers': isChecked2,
    }).then((value) {
      print('Animals Added: ${value.id}');
    }).catchError((error) {
      print('Failed to add Animals: $error');
    });
  }

  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: secondaryColor,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: primaryColor,
              )),
          title: const Text(
            "Add Address Details",
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
                color: primaryColor),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
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
                    isRequired: true,
                    controller: emailController,
                    width: double.infinity,
                    height: 60,
                    hintText: 'Enter Your Email',
                    borderRadius: BorderRadius.circular(12),
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
                        const Padding(
                          padding: EdgeInsets.only(top: 10, left: 20),
                          child: Text(
                            "Delivery",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                                color: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 15),
                        customDropDownButton(
                          width: double.infinity,
                          height: 60,
                          hintText: "   Pakistan",
                          hintStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: primaryColor),
                          dropdownItems: const ["Pakistan", "NA Right Now"],
                          onChanged: (ConValue) {
                            setState(() {
                              country = ConValue!;
                            });
                          },
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: customTextField(
                            isRequired: true,
                            controller: fNameController,
                            width: double.infinity,
                            height: 60,
                            hintText: 'First Name',
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: customTextField(
                            isRequired: true,
                            controller: lNameController,
                            width: double.infinity,
                            height: 60,
                            hintText: 'Last Name',
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: customTextField(
                            isRequired: true,
                            controller: addressController,
                            width: double.infinity,
                            height: 60,
                            hintText: 'Address',
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: customTextField(
                            isRequired: true,
                            controller: cityController,
                            width: double.infinity,
                            height: 60,
                            hintText: 'State/City',
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: customTextField(
                            isRequired: true,
                            controller: postalCodeController,
                            width: double.infinity,
                            height: 60,
                            hintText: 'Postal Code',
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: customTextField(
                            isRequired: true,
                            controller: phoneController,
                            width: double.infinity,
                            height: 60,
                            hintText: 'Phone',
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            children: [
                              Checkbox(
                                  value: isChecked1,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked1 = value ?? false;
                                    });
                                  }),
                              const Text('Save this Information')
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            children: [
                              Checkbox(
                                  value: isChecked2,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked2 = value ?? false;
                                    });
                                  }),
                              const Text('Text me with news offers')
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0x5e99f1f1),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  "Free Shipping Across \n Pakistan (First PKR 10,000+) order",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(12.0),
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
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: secondaryColor,
                  elevation: 0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 10, left: 20),
                          child: Text(
                            "Payment",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                                color: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.only(top: 10, left: 20),
                          child: Text(
                            "All transactions are secure and encrypted",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomRadioButton(
                            value: "COD",
                            groupValue: selectedPayment,
                            onChange: (value) {
                              setState(() {
                                selectedPayment = value;
                              });
                            },
                            text: "Cash on Delivery (COD)",
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomRadioButton(
                            value: "card",
                            groupValue: selectedPayment,
                            // Use selectedValue to keep track
                            onChange: (value) {
                              setState(() {
                                selectedPayment =
                                    value; // Update selectedValue when radio button is selected
                              });
                            },
                            text: "Debit - Credit Card ",
                            imagePaths: const [
                              "assets/images/jazzcash.png",
                              "assets/images/masterCard.png",
                              "assets/images/visa.png"
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
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
                        const Padding(
                          padding: EdgeInsets.only(top: 10, left: 20),
                          child: Text(
                            "Billing Address",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                                color: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomRadioButton(
                            value: "shipAdd",
                            groupValue: selectedBillValue,
                            // Use selectedValue to keep track
                            onChange: (value) {
                              setState(() {
                                selectedBillValue = value;
                                useDifferentAddress = false;
                              });
                            },
                            text: "Same as Shipping Address",
                          ),
                        ),
                        const SizedBox(height: 10),
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
                        const SizedBox(height: 10),
                        if (useDifferentAddress)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            child: customTextField(
                              width: double.infinity,
                              height: 60,
                              hintText: 'Enter Different Address',
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(top: 10, left: 20),
                  child: Text(
                    "Order Summary",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: secondaryColor,
                    elevation: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child:
                                          Image.network(widget.firstImage)),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5),
                                  Text(
                                    '${widget.name}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5, top: 5),
                                    child: Text(
                                      "${widget.species}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5, top: 5),
                                    child: Text(
                                      "${widget.location}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5, top: 5),
                                    child: Text(
                                      "PKR ${widget.price}",
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

                        // Conditionally show the TextField based on useDifferentAddress
                        const SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Items Total",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Rs. ${widget.price}",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Delivery Fee",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Rs. 99",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "    Total",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Rs. ${int.parse(widget.price) + 99}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: primaryButton(
                            double.infinity,
                            'Proceed',
                            () {
                              addNewAddress();
                              if (_formKey.currentState?.validate() ??
                                  false) {
                                if (selectedPayment == "COD") {
                                  int total = int.parse(widget.price);
                                  String image1 = widget.firstImage;
                                  String name1 = widget.name;
                                  String sellerId = widget.sellerId;

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => cashonDelivery(
                                            total, image1, name1, sellerId),
                                      ));
                                } else {
                                  int amount = int.parse(widget.price) +
                                      99; // Calculate the amount
                                  StripeService.instance.makePayment(amount);
                                }
                              } else {
                                // Form is not valid, show errors
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                          "Please Complete All Required Fields",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 15),
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("OK")),
                                        ],
                                      );
                                    });
                              }
                            }, //onPressed
                          ),
                        ),

                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 180),
              ], //   main Col =========================================================
            ),
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
        padding: const EdgeInsets.all(10),
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
              style: const TextStyle(
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
