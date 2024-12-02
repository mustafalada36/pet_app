import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailsScreen extends StatelessWidget {
  final String adId; // Ad's unique identifier

  DetailsScreen({required this.adId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ad Details'),
        backgroundColor: Colors.deepPurple, // Example primary color
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future:
            FirebaseFirestore.instance.collection('Animals').doc(adId).get(),
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
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Ad Title
                Text(
                  ad['title'],
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                // Key Details
                Text("Name: ${ad['name']}"),
                Text("Price: PKR ${ad['price']}"),
                Text("Species: ${ad['species']}"),
                Text("Breed: ${ad['breed'] ?? 'N/A'}"),
                Text("Sex: ${ad['sex']}"),
                Text("Age: ${ad['age']}"),
                Text("Weight: ${ad['weight']} kg"),
                Text("Vaccinated: ${ad['vaccine'] == true ? 'Yes' : 'No'}"),
                Text("Location: ${ad['location']}"),
                const SizedBox(height: 10),

                // Description
                const Text(
                  "Description:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  ad['description'],
                  style: const TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 20),

                // Image Carousel
                ad['image'] != null && ad['image'].isNotEmpty
                    ? SizedBox(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: ad['image'].length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
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
              ],
            ),
          );
        },
      ),
    );
  }
}
