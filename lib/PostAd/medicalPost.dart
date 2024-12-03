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
import 'package:pet_app/Screens/seeAllMedical.dart';
import 'package:pet_app/constants.dart';
import 'package:http/http.dart' as http;
import '../Other Services/current_location.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class medicalPost extends StatefulWidget {
  const medicalPost({super.key});

  @override
  State<medicalPost> createState() => _medicalPostState();
}

class _medicalPostState extends State<medicalPost> {
  final String? userId = FirebaseAuth.instance.currentUser?.uid;

  void addMedical() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    await firestore.collection('Medical').add({
      'userId': userId,
      'category': selectedCategory,
      'description': descController.text,
      'image': _uploadedImageUrls,
      'name': nameController.text,
      'fee': feeController.text,
      'appTime': selectedAT,
      'timestamp': FieldValue.serverTimestamp(),
      'title': titleController.text,
      'doctor': doctorController.text,
      'location': cityName,
    }).then((value) {
      print('Medical Added: ${value.id}');
    }).catchError((error) {
      print('Failed to add Medical: $error');
    });
  }

  final ImagePicker _picker = ImagePicker();
  List<XFile>? _selectedImages = []; // Holds selected images
  List<String> _uploadedImageUrls = [];

  // Function to pick multiple images
  Future<void> pickImages() async {
    try {
      final List<XFile>? pickedImages = await _picker.pickMultiImage();
      if (pickedImages != null) {
        setState(() {
          _selectedImages = pickedImages;
        });
        // Upload all selected images
        for (var image in _selectedImages!) {
          await _uploadToCloudinary(image);
        }
      }
    } catch (e) {
      print('Error picking images: $e');
    }
  }

  // Function to upload an image to Cloudinary
  Future<void> _uploadToCloudinary(XFile imageFile) async {
    const cloudinaryUrl =
        'https://api.cloudinary.com/v1_1/dr5nxrgfx/image/upload';
    const uploadPreset = 'abcdefght';

    try {
      final request = http.MultipartRequest('POST', Uri.parse(cloudinaryUrl));
      request.fields['upload_preset'] = uploadPreset;
      request.files
          .add(await http.MultipartFile.fromPath('file', imageFile.path));

      final response = await request.send();
      if (response.statusCode == 200) {
        final responseData = await http.Response.fromStream(response);
        final responseJson = json.decode(responseData.body);
        setState(() {
          _uploadedImageUrls
              .add(responseJson['secure_url']); // Add uploaded image URL
        });
        print('Image uploaded successfully: ${responseJson['secure_url']}');
      } else {
        print('Failed to upload image: ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  final _formKey = GlobalKey<FormState>(); // Key for the form

  String selectedCategory = "Animals";
  final categories = ['Animals', 'Food', 'Maintainance', 'Medical'];
  String selectedAT = "NA";

  TextEditingController nameController = TextEditingController();
  TextEditingController feeController = TextEditingController();
  TextEditingController doctorController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              //===========================================main col

              const SizedBox(height: 15),

              GestureDetector(
                onTap: pickImages,
                child: CircleAvatar(
                  backgroundColor: secondaryColor,
                  radius: 70,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Image.asset("assets/images/camera.png"),
                      const SizedBox(height: 15),
                      const Text(
                        'Add Images',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Display selected images *************************
              _selectedImages != null && _selectedImages!.isNotEmpty
                  ? Wrap(
                      spacing: 8,
                      children: _selectedImages!.map((image) {
                        return Image.file(
                          File(image.path),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        );
                      }).toList(),
                    )
                  : Text('No images selected'),

              //****************************************

              const SizedBox(height: 20),

              Column(
                children: [
                  const SizedBox(height: 15),
                  textHeading(text: "Name *"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: customTextField(
                      controller: nameController,
                      width: double.infinity,
                      height: 60,
                      isRequired: true,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const lineWidget(),

                  const SizedBox(height: 15),

                  textHeading(text: "Doctor *"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: customTextField(
                      isRequired: true,
                      controller: doctorController,
                      textInputType: TextInputType.number,
                      width: double.infinity,
                      height: 60,
                    ),
                  ),

                  const SizedBox(height: 15),
                  const lineWidget(),
                  const SizedBox(height: 15),
                  textHeading(text: "Fee *"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: customTextField(
                      isRequired: true,
                      controller: feeController,
                      textInputType: TextInputType.number,
                      width: double.infinity,
                      height: 60,
                    ),
                  ),

                  const SizedBox(height: 15),
                  const lineWidget(),

                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textHeading(text: "Appointment Time *"),
                            const SizedBox(height: 10),
                            Container(
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15),
                                child: customDropDownButton(
                                  width: 200,
                                  height: 60,
                                  hintText: "Hours",
                                  dropdownItems: const [
                                    "NA",
                                    "9am to 12pm",
                                    "1pm to 4pm",
                                    "4pm to 7pm",
                                  ],
                                  onChanged: (String? value) {
                                    setState(() {
                                      selectedAT = value ??
                                          "NA"; // Update selectedAge based on user selection
                                    });
                                  },
                                )),
                          ],
                        ),
                      ),
                    ], //\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
                  ),
                  const SizedBox(height: 10),

                  const lineWidget(),
                  const SizedBox(height: 15),
                  //tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt
                  textHeading(text: "Location *"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: GestureDetector(
                          onTap: () async {
                            // Navigate to CurrentLocation screen and get the selected city
                            final selectedCity = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CurrentLocation(),
                              ),
                            );
                            // If a city is selected, update the cityName
                            if (selectedCity != null) {
                              setState(() {
                                cityName = selectedCity;
                              });
                            }
                          },
                          child: Row(
                            children: [
                              Text(
                                cityName.isNotEmpty
                                    ? cityName // Display fetched city name
                                    : "Choose", // Default text
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 100),
                              const Icon(
                                Icons.location_on,
                                color: Colors.redAccent,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: IconButton(
                          onPressed: () async {
                            // Navigate to the Location screen and get the selected city
                            final selectedCity = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Location(),
                              ),
                            );
                            // If a city is selected, update the cityName
                            if (selectedCity != null) {
                              setState(() {
                                cityName =
                                    selectedCity; // Update the cityName with selected city
                              });
                            }
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Color(0xFF267E1E),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  const lineWidget(),
                  const SizedBox(height: 15),
                  textHeading(
                    text: "Ad Title *",
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: customTextField(
                      isRequired: true,
                      controller: titleController,
                      width: double.infinity,
                      height: 60,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const lineWidget(),
                  const SizedBox(height: 15),

                  textHeading(
                    text: "Description *",
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: customTextField(
                      controller: descController,
                      width: double.infinity,
                      height: 60,
                      isRequired: true,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const lineWidget(),
                  const SizedBox(height: 15),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        addMedical();
                        if (_selectedImages == null ||
                            _selectedImages!.isEmpty) {
                          // Show AlertDialog if images are not selected
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text(
                                  "Images Required",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                content: const Text(
                                  "Please select at least one image before proceeding.",
                                  style: TextStyle(fontSize: 16),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                    child: const Text(
                                      "OK",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        } else if (_formKey.currentState?.validate() ??
                            false) {
                          // Form is valid, proceed
                          final images = _selectedImages
                                  ?.map((image) => image.path)
                                  .toList() ??
                              [];

                          final category = selectedCategory;
                          final name = nameController.text;
                          final fee = feeController.text;
                          final doctor = doctorController.text;
                          final appTime = selectedAT;
                          final location = cityName;
                          final title = titleController.text;
                          final description = descController.text;

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => seeAllMedical()),
                          );
                        } else {
                          // Form is not valid, show errors
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    "Please Complete All Required Fields",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 15),
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
                        'Post',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500, // medium weight
                          color: Colors.white, // text color
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ], //=================================================main col
          ),
        ),
      ),
    );
  }
}
