import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_app/Screens/profileScreen.dart';
import 'package:pet_app/constants.dart';

import '../Reuseable Components/topContainer.dart';
import 'adDetails.dart';
import 'chatsScreen.dart';
import 'homeScreen.dart';

class myAds extends StatefulWidget {
  @override
  State<myAds> createState() => _myAdsState();
}

class _myAdsState extends State<myAds> {
  int _currentIndex = 3;
  late String userId;
  final List<Widget> _pages = [
    const Center(child: Text('Home Screen')),
    const Center(child: Text('Chat Screen')),
    const Center(child: Text('Post Ad Screen')),
    const Center(child: Text('My Ads Screen')),
    const Center(child: Text('Profile Screen')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Here you can define the action when an item is tapped
    switch (index) {
      case 0:
        print("Home tapped");
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const homeScreen()));
        break;
      case 1:
        print("Chat tapped");
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const ChatsScreen()));
        break;
      case 2:
        print("Post Ad tapped");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => adDetails()));

      case 3:
        print("My Ads tapped");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => myAds()));

      case 4:
        print("Profile tapped");
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => profileScreen()));
        break;
      default:
        print("Unknown tab");
    }
  }

  @override
  void initState() {
    super.initState();
    // Fetch the logged-in user's ID
    userId = FirebaseAuth.instance.currentUser?.uid ?? '';
  }

  Future<void> deleteAd(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('Animals')
          .doc(documentId)
          .delete();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Ad deleted successfully")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to delete ad: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "My Ads",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Animals')
            .where('userId', isEqualTo: userId) // Filter by logged-in user
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No ads found"));
          }

          final adsList = snapshot.data!.docs;

          return Column(
            children: [
              // Top Row with Ads Summary
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  topContainer(
                    "Ads",
                    120,
                    clr: primaryColor,
                    textClr: Colors.white,
                    image: Image.asset("assets/images/activeSymbol.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Text(
                        "${adsList.length}", // Number of ads
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Ads List
              Expanded(
                child: ListView.builder(
                  itemCount: adsList.length,
                  itemBuilder: (context, index) {
                    final ad = adsList[index].data() as Map<String, dynamic>;
                    final documentId = adsList[index].id; // Document ID
                    final images = ad['image'] ?? [];
                    final imageUrl = images.isNotEmpty ? images[0] : null;

                    return Card(
                      color: secondaryColor,
                      elevation: 0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image Section
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: imageUrl != null
                                  ? Image.network(
                                      imageUrl,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Icon(Icons.image,
                                            size: 50);
                                      },
                                    )
                                  : const Icon(Icons.image, size: 100),
                            ),
                            const SizedBox(width: 20),
                            // Details Section
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ad['name'] ?? 'No Name',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    ad['species'] ?? 'Unknown Species',
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    ad['location'] ?? 'Unknown Location',
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "PKR ${ad['price'] ?? '0'}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.green),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            // Delete Icon Section
                            IconButton(
                              icon:
                                  const Icon(Icons.delete, color: Colors.red),
                              onPressed: () async {
                                final confirm = await showDialog<bool>(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text("Confirm Deletion"),
                                    content: const Text(
                                        "Are you sure you want to delete this ad?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, false),
                                        child: const Text("Cancel"),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, true),
                                        child: const Text("Delete"),
                                      ),
                                    ],
                                  ),
                                );

                                if (confirm ?? false) {
                                  await deleteAd(documentId);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        backgroundColor: Colors.white,
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.chat, size: 30, color: Colors.white),
          Icon(Icons.add_circle_outline, size: 40, color: Colors.white),
          Icon(Icons.list_alt, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        onTap: _onItemTapped,
        color: Colors.green,
        buttonBackgroundColor: Colors.green.shade700,
        height: 60,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
      ),
    );
  }
}
