import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_app/PostAd/animalPost.dart';
import 'package:pet_app/PostAd/foodPost.dart';
import 'package:pet_app/PostAd/maintainancePost.dart';
import 'package:pet_app/PostAd/medicalPost.dart';
import 'package:pet_app/Reuseable%20Components/customDropDownTextField.dart';
import 'package:pet_app/Reuseable%20Components/customTextField.dart';
import 'package:pet_app/Reuseable%20Components/lineWidget.dart';
import 'package:pet_app/Reuseable%20Components/textHeading.dart';
import 'package:pet_app/Screens/buyScreen.dart';
import 'package:pet_app/Screens/location.dart';
import 'package:pet_app/constants.dart';
import 'package:http/http.dart' as http;
import '../Other Services/current_location.dart';
import 'homeScreen.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class adDetails extends StatefulWidget {
  @override
  State<adDetails> createState() => _adDetailsState();
}

class _adDetailsState extends State<adDetails> {
  final String? userId = FirebaseAuth.instance.currentUser?.uid;

  //*************************************************

  String selectedCategory = "Animals";
  final categories = ['Animals', 'Food', 'Maintainance', 'Medical'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        leading: IconButton(
          color: primaryColor,
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => homeScreen(),
                ));
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          "Include Some Details",
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 25, color: primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              //===========================================main col

              const SizedBox(height: 20),

              textHeading(text: "Categories *"),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CircleAvatar(
                      backgroundColor: primaryColor,
                      radius: 30,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Image.asset(
                            "assets/images/loginimg.png",
                            height: 25,
                            width: 25,
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => showCategorySelection(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            selectedCategory,
                            // Display the selected species
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: primaryColor,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          weight: 50,
                          color: primaryColor,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              const lineWidget(),

              //if logic '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
              if (selectedCategory == 'Animals') ...[animalPost()],
              if (selectedCategory == 'Food') ...[foodPost()],
              if (selectedCategory == 'Maintainance') ...[maintainancePost()],
              if (selectedCategory == 'Medical') ...[medicalPost()],
            ], //=================================================main col
          ),
        ),
      ),
    );
  }

  void showCategorySelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: categories
              .map(
                (category) => ListTile(
                  title: Text(category),
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                    Navigator.pop(context);
                  },
                ),
              )
              .toList(),
        );
      },
    );
  }
}
