import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/Reuseable%20Components/launchButton.dart';
import 'package:pet_app/Reuseable%20Components/primaryButton.dart';
import 'package:pet_app/Reuseable%20Components/safetySection.dart';
import 'package:pet_app/Reuseable%20Components/secondaryButton.dart';
import 'package:pet_app/Screens/addNewAddress.dart';
import 'package:pet_app/constants.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

import '../ChatScreen/chat_screen.dart';
import 'homeScreen.dart';

class buyFood extends StatefulWidget {
  final String adId;

  buyFood({required this.adId});

  @override
  State<buyFood> createState() => _buyFoodState();
}

class _buyFoodState extends State<buyFood> {
  final String? userId = FirebaseAuth.instance.currentUser?.uid;

  final String? email = FirebaseAuth.instance.currentUser?.email;

  String phone = '';

  Future<void> fetchUserData() async {
    if (userId == null) return;

    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .get();

      if (userDoc.exists) {
        setState(() {
          phone = userDoc['phone'] ?? '';
        });
      }
    } catch (e) {
      debugPrint("Error fetching user data: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUserData(); // Fetch user data on screen initialization
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('Food')
                .doc(widget.adId)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (!snapshot.hasData ||
                  snapshot.data == null ||
                  !snapshot.data!.exists) {
                return const Center(child: Text('Ad not found'));
              }

              var ad = snapshot.data!;
              final String adOwnerId = ad['userId'];
              return Stack(
                children: [
                  // Image at the top
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 294,
                            child: // Image Carousel
                                ad['image'] != null && ad['image'].isNotEmpty
                                    ? SizedBox(
                                        height: 150,
                                        width: double.infinity,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: ad['image'].length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.network(
                                                  ad['image'][index],
                                                  fit: BoxFit.cover,
                                                  width: 150,
                                                  height: 150,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    : const Text(
                                        "No images available",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                          ),
                          Positioned(
                            top: 16,
                            left: 16,
                            right: 16,
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
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
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: Color(0xFFF6FAFF),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: const [
                                    Icon(Icons.favorite,
                                        color: Color(0xFFFFFFFF)),
                                    SizedBox(width: 10),
                                    Icon(Icons.share,
                                        color: Color(0xFFFFFFFF)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Scrollable content container at the bottom
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
                          padding:
                              const EdgeInsets.symmetric(horizontal: 20.0),
                          // Padding from left and right
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // First Row: "British Shorthair" and "Rs/150,000"
                              SizedBox(height: 20),
                              // Adding some space from the top
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${ad['name']}",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'PKR ${ad['price']}',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              // Second Row: "Cat breed" text with no space above it
                              Row(
                                children: [
                                  Text(
                                    '${ad['species']}',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                              // "About British Shorthair" text
                              const SizedBox(height: 14),
                              // Padding from top
                              Container(
                                width: double.infinity,
                                color: Colors.grey.shade300,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Text(
                                        "Details:",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          // Semibold
                                          color: Colors.black, // #000000
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Text(
                                            "Condition:",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight:
                                                  FontWeight.w400, // Semibold
                                              color: primaryColor, // #000000
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 70),
                                          child: Text(
                                            '${ad['Condition']}',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: primaryColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "Description",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600, // Semibold
                                  color: Colors.black, // #000000
                                ),
                              ),
                              Text(
                                '${ad['title']}',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: primaryColor,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                '${ad['description']}',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                ),
                              ),

                              const SizedBox(height: 200),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  secondaryButton(170, "Add to Cart"),
                                  primaryButton(
                                    170,
                                    "Buy Now",
                                    () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => addNewAddress(
                                            name: ad['name'],
                                            firstImage: ad['image'][0],
                                            species: ad['species'],
                                            location: ad['location'],
                                            price: ad['price'],
                                            sellerId: ad['userId']),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              SafetySection(),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 30, bottom: 35),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    LaunchButton(
                                      icon: Icons.call,
                                      onTap: () async {
                                        Uri uri = Uri.parse('tel:$phone');
                                        if (!await launcher.launchUrl(uri)) {
                                          debugPrint(
                                              "Could not launch the uri"); // because the simulator doesn't has the phone app
                                        }
                                      },
                                    ),
                                    LaunchButton(
                                      icon: Icons.email,
                                      onTap: () async {
                                        Uri uri = Uri.parse(
                                          'mailto:$email?subject=Pet App&body=Hi, I want to buy this pet',
                                        );
                                        if (!await launcher.launchUrl(uri)) {
                                          debugPrint(
                                              "Could not launch the uri"); // because the simulator doesn't has the email app
                                        }
                                      },
                                    ),
                                    LaunchButton(
                                      icon: Icons.message,
                                      onTap: () {
                                        final String currentUserId =
                                            FirebaseAuth
                                                .instance.currentUser!.uid;

                                        // Generate chatId as in ChatScreen
                                        final String chatId =
                                            "${widget.adId}_${currentUserId}_${adOwnerId}";

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ChatScreen(
                                              adId: widget.adId,
                                              adOwnerId: adOwnerId,
                                              chatId:
                                                  chatId, // Pass the same chatId
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 50),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }));
  }
}
