import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/Reuseable%20Components/primaryButton.dart';
import 'package:pet_app/Reuseable%20Components/safetySection.dart';
import 'package:pet_app/Reuseable%20Components/secondaryButton.dart';
import 'package:pet_app/Screens/addNewAddress.dart';
import 'package:pet_app/constants.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

import '../ChatScreen/chat_screen.dart';
import '../Reuseable Components/launchButton.dart';

class buyMedical extends StatefulWidget {
  final String adId;

  buyMedical({required this.adId});

  @override
  State<buyMedical> createState() => _buyMedicalState();
}

class _buyMedicalState extends State<buyMedical> {
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

  Future<void> saveToFavorites(
      String name, String firstImage, String price) async {
    if (userId == null) return; // Ensure the user is logged in

    try {
      await FirebaseFirestore.instance
          .collection('Users') // Save data under the 'Users' collection
          .doc(userId) // Use the current user's ID
          .collection(
              'Favorites') // Nested collection for user-specific favorites
          .add({
        'name': name,
        // Name of the food item
        'image': firstImage,
        // First image URL
        'price': price,
        // Price of the item
        'createdAt': FieldValue.serverTimestamp(),
        // Optional: Add a timestamp
      });
      debugPrint("Favorite added successfully");
    } catch (e) {
      debugPrint("Error adding favorite: $e");
    }
  }

  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('Medical')
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
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Color(0xFFF6FAFF),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                      isFav
                                          ? Icons.favorite
                                          : Icons.favorite_outline,
                                      color: Colors.red),
                                  onPressed: () {
                                    saveToFavorites(ad['name'],
                                        ad['image'][0], ad['price']);
                                    setState(() {
                                      isFav = !isFav;
                                    });
                                  },
                                ),
                                SizedBox(width: 10),
                                Icon(Icons.share, color: Colors.black),
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
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                'PKR ${ad['fee']}',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: primaryColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          Text(
                            '${ad['title']}',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: primaryColor,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(height: 20),
                              Expanded(
                                child: _buildInfoRow(
                                  'Location',
                                  '${ad['location']}',
                                  Icons.pin_drop_rounded,
                                ),
                              ),
                              const SizedBox(height: 23),
                              Expanded(
                                child: _buildInfoRow(
                                  'Booking Time',
                                  '${ad['appTime']}',
                                  Icons.timer_outlined,
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(height: 20),
                              _buildInfoRow('Doctor Name', '${ad['doctor']}',
                                  Icons.pin_drop_rounded,
                                  width: 160),
                              const SizedBox(height: 23),
                              _buildInfoRow('Doctor Fee', '${ad['fee']}',
                                  Icons.timer_outlined,
                                  width: 160),
                              const SizedBox(height: 20),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            '${ad['description']}',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 100),
                          primaryButton(
                            double.infinity,
                            "Book Now",
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => addNewAddress(
                                    name: ad['name'],
                                    firstImage: ad['image'][0],
                                    time: ad['timestamp'],
                                    species: ad['doctor'],
                                    location: ad['location'],
                                    price: ad['fee'],
                                    sellerId: ad['userId']),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SafetySection(),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 30, bottom: 35),
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
                                    final String currentUserId = FirebaseAuth
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
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildInfoRow(String title, String value, IconData icon,
      {double width = 144}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: width,
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
}
