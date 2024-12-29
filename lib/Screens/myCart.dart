import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Firebase_services/snack_bar.dart';
import '../Reuseable Components/topContainer.dart';
import '../constants.dart';
import 'homeScreen.dart';

class myCart extends StatefulWidget {
  const myCart({super.key});

  @override
  State<myCart> createState() => _myCartState();
}

class _myCartState extends State<myCart> {
  int quantity = 1;

  final String? userId = FirebaseAuth.instance.currentUser?.uid;

  Future<void> deleteAd(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('Users') // Access the Users collection
          .doc(userId) // Specify the logged-in user's document
          .collection('Favorites')
          .doc(documentId)
          .delete();
      mySnack.success("Ad deleted successfully");
    } catch (e) {
      mySnack.error("Failed to delete ad: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: primaryColor,
          ),
        ),
        title: const Text(
          "My Cart",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 25,
            color: primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users') // Access the Users collection
            .doc(userId) // Specify the logged-in user's document
            .collection('Favorites')
            .orderBy('createdAt',
                descending: true) // Optional: Order by timestamp
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No Items Added to Cart"));
          }

          final favList = snapshot.data!.docs;

          return ListView.builder(
            itemCount: favList.length,
            itemBuilder: (context, index) {
              final item = favList[index].data() as Map<String, dynamic>;
              final documentId = favList[index].id; // Document ID
              final imageUrl =
                  item['image'] ?? ''; // Ensure image is a valid URL

              return Card(
                color: secondaryColor,
                elevation: 0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image Section
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: imageUrl.isNotEmpty
                            ? Image.network(
                                imageUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.image, size: 50);
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
                              item['name'] ?? 'No Name',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "PKR ${item['price'] ?? '0'}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Delete Icon Section
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () async {
                          final confirm = await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Confirm Deletion"),
                              content: const Text(
                                  "Are you sure you want to remove this item?"),
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
                            try {
                              await FirebaseFirestore.instance
                                  .collection('Users')
                                  .doc(userId)
                                  .collection('Favorites')
                                  .doc(documentId)
                                  .delete();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Item removed successfully"),
                                ),
                              );
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Error: $e"),
                                ),
                              );
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
