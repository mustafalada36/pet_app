import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pet_app/Reuseable Components/adsTemplate.dart';
import 'package:pet_app/Screens/homeScreen.dart';
import 'package:pet_app/Screens/myAds.dart';
import 'package:pet_app/constants.dart';

class buyScreen extends StatelessWidget {
  final String category;
  final String name;
  final String price;
  final String species;
  final String? breed;
  final String sex;
  final String age;
  final String weight;
  final String vaccine;
  final String location;
  final String title;
  final String description;
  final List<String>? images;

  const buyScreen({
    Key? key,
    required this.category,
    required this.name,
    required this.price,
    required this.species,
    this.breed,
    required this.sex,
    required this.age,
    required this.vaccine,
    required this.location,
    required this.title,
    required this.description,
    required this.weight,
    this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Posted Successfully!"),
          backgroundColor: Colors.green,
          duration:
              Duration(seconds: 3), // Snackbar will disappear after 3 seconds
        ),
      );
    });
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => myAds(
            adsList: [
              // ...adsList, // This should be the existing list of ads passed from the previous screen
              {
                // First image from the uploaded images
                'image': images?.first ?? '',

                'name': name,
                'species': species,
                'location': location,
                'price': price,
              }
            ],
          ),
        ),
      );
    });

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  //***************
                  // Replacing Image.asset with images ListView.builder
                  (images != null && images!.isNotEmpty)
                      ? Container(
                          height: 290,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: images?.length ?? 0,
                            shrinkWrap: true,
                            // Shrink the ListView to fit content
                            physics: ClampingScrollPhysics(),
                            // Avoid bouncing overflow
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.file(
                                  File(images![index]),
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                        )
                      : Text('No images available'),
                  //***************

                  Positioned(
                    top: 16,
                    left: 16,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => homeScreen(),
                                  ));
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Color(0xFFF6FAFF),
                            ),
                          ),
                        ),
                        Row(
                          children: const [
                            Icon(Icons.favorite, color: Color(0xFFFFFFFF)),
                            SizedBox(width: 10),
                            Icon(Icons.share, color: Color(0xFFFFFFFF)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 244,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height - 244,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "$name",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Rs/ $price',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '$species',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Text(
                        '$title',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(height: 13.7),
                      Text(
                        '$category',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            color: Colors.red),
                      ),
                      Text(
                        '$description',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(height: 20),
                          _buildInfoRow('Age', '$age', Icons.pets),
                          const SizedBox(height: 23),
                          _buildInfoRow('Weight', '$weight lbs', Icons.scale),
                          const SizedBox(height: 20),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(height: 20),
                          _buildCenteredInfoRow(
                              'Breed', '$breed', Icons.category),
                          const SizedBox(height: 23),
                          _buildInfoRow('Sex', '$sex', Icons.transgender),
                          const SizedBox(height: 20),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _buildInfoRow(
                          'Vaccination', '$vaccine', Icons.medical_services),
                      const SizedBox(height: 20),
                      _buildShadowContainer(),
                      const SizedBox(height: 20),
                      _buildSafetySection(),
                      _buildRelatedAds(),
                      _buildContactActions(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String title, String value, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 144,
          height: 56,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  size: 26,
                  color: primaryColor,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: primaryColor,
                    ),
                  ),
                  Text(
                    value,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF101113),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCenteredInfoRow(String title, String value, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 144,
          height: 56,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  size: 26,
                  color: primaryColor,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: primaryColor,
                    ),
                  ),
                  Text(
                    value,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF101113),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildShadowContainer() {
    return Container(
      width: double.infinity,
      height: 109,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 5),
          ),
        ],
      ),
    );
  }

  Widget _buildSafetySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About your safety!',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: primaryColor,
          ),
        ),
        const SizedBox(height: 10),
        _buildSafetyBullet('Avoid sharing personal information.'),
        _buildSafetyBullet('Meet in a public place.'),
        _buildSafetyBullet('Report suspicious activity.'),
        _buildSafetyBullet('Trust your instincts.'),
      ],
    );
  }

  Widget _buildSafetyBullet(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.58),
      child: Row(
        children: [
          Icon(Icons.circle, size: 6, color: primaryColor),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRelatedAds() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 35.11),
        const Text(
          'Related ads',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 9),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //  Expanded(child: adsTemplate()),
            const SizedBox(width: 9.39),
            //  Expanded(child: adsTemplate()),
          ],
        ),
      ],
    );
  }

  Widget _buildContactActions() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildContactIcon(Icons.email),
          const SizedBox(width: 44.96),
          _buildContactIcon(Icons.call),
          const SizedBox(width: 44.96),
          _buildContactIcon(Icons.message),
        ],
      ),
    );
  }

  Widget _buildContactIcon(IconData icon) {
    return Container(
      width: 56,
      height: 43,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Icon(
        icon,
        color: primaryColor,
      ),
    );
  }
}
