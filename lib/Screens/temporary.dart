import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

class adDetails2 extends StatefulWidget {
  @override
  State<adDetails2> createState() => _adDetailsState2();
}

class _adDetailsState2 extends State<adDetails2> {
  String selectedCategory = 'Animals'; // Default category

  final categories = ['Animals', 'Food', 'Vehicles', 'Electronics'];

  // Controllers for fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ad Details"),
        actions: [
          IconButton(
            icon: Icon(Icons.category),
            onPressed: () => showCategorySelection(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Common fields
              customTextField(
                controller: nameController,
                hintText: 'Name',
                width: double.infinity,
                height: 120,
              ),
              const SizedBox(height: 10),
              customTextField(
                controller: priceController,
                hintText: 'Price',
                width: double.infinity,
                height: 120,
              ),
              const SizedBox(height: 10),
              customTextField(
                controller: locationController,
                hintText: 'Location',
                width: double.infinity,
                height: 120,
              ),
              const SizedBox(height: 10),
              customTextField(
                controller: titleController,
                hintText: 'Title',
                width: double.infinity,
                height: 120,
              ),
              const SizedBox(height: 10),
              customTextField(
                controller: descriptionController,
                hintText: 'Description',
                width: double.infinity,
                height: 120,
              ),

              // Category-specific fields
              if (selectedCategory == 'Animals') ...[
                customTextField(
                  controller: weightController,
                  hintText: 'Weight',
                  width: double.infinity,
                  height: 120,
                ),
                const SizedBox(height: 10),
                customTextField(
                  controller: ageController,
                  hintText: 'Age',
                  width: double.infinity,
                  height: 120,
                ),
              ],
            ],
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
