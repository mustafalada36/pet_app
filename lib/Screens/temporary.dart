/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/constants.dart';

class orderPlacedScreen extends StatefulWidget {
  @override
  _orderPlacedScreenState createState() => _orderPlacedScreenState();
}

class _orderPlacedScreenState extends State<orderPlacedScreen> {
  final String? userId = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('OrderPlaced')
          .where('userId',
              isEqualTo: userId) // Filter orders by the logged-in user
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text("No orders found"));
        }

        final orderList = snapshot.data!.docs;

        return ListView.builder(
          itemCount: orderList.length,
          itemBuilder: (context, index) {
            final order = orderList[index].data() as Map<String, dynamic>;
            final documentId = orderList[index].id; // Get document ID
            final imageUrl = order['image'] ?? '';
            final name = order['name'] ?? 'No Name';
            final price = order['price'] ?? '0';
            final orderTimestamp = order['timestamp'] as Timestamp;
            // Convert Timestamp to DateTime
            DateTime orderDate = orderTimestamp.toDate();

            // Format DateTime as string (e.g., 'Dec 5, 2024')
            String formattedDate =
                "${orderDate.day}-${orderDate.month}-${orderDate.year}";

            return Container(
              width: double.infinity,
              child: Card(
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
                      // Order Details Section
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  name,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "PKR $price",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Order Number: $documentId",
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Payment Method: Cash On Delivery",
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.black),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Order Date: $formattedDate",
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
*/
