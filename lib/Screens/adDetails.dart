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

/*
  void addAnimals() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    await firestore.collection('Animals').add({
      'userId': userId,
      'age': selectedAge,
      'breed': breedController.text,
      'category': selectedCategory,
      'description': descController.text,
      'image': _uploadedImageUrls,
      'name': nameController.text,
      'price': priceController.text,
      'sex': selectedGender,
      'species': selectedSpecies,
      'timestamp': FieldValue.serverTimestamp(),
      'title': titleController.text,
      'vaccine': selectedVaccine,
      'weight': weightController.text,
      'location': cityName,
    }).then((value) {
      print('Animals Added: ${value.id}');
    }).catchError((error) {
      print('Failed to add Animals: $error');
    });
  }
*/

  //*************************************************
/*
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
*/

  // Function to upload an image to Cloudinary
/*
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
*/

  //*************************************************
/*  final _formKey = GlobalKey<FormState>(); // Key for the form
  String selectedSpecies = "None";
  String selectedGender = "NA";
  String selectedVaccine = "NA";*/
  String selectedCategory = "Animals";
  final categories = ['Animals', 'Food', 'Maintainance', 'Medical'];

/*
  String selectedAge = "NA";

  // Function to update selected gender
  void _selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  void _selectVaccine(String vaccine) {
    setState(() {
      selectedVaccine = vaccine;
    });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController breedController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController weightController = TextEditingController();
*/

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

              /*const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  color: secondaryColor,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          "UPLOAD UPTO 5 IMAGES",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Color(0xFF267E1E)),
                        ),
                      ),
                      const SizedBox(width: 15),
                      IconButton(
                        color: primaryColor,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                  : Text('No images selected'),*/

              //****************************************

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
