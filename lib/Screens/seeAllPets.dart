import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/Reuseable%20Components/adsTemplate.dart';
import 'package:pet_app/Reuseable%20Components/topContainer.dart';
import '../constants.dart';

class seeAllPets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Pets',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: primaryColor,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                topContainer(
                  "Pets",
                  110,
                  image: Image.asset("assets/images/activeSymbol.png"),
                  clr: primaryColor,
                  textClr: Colors.white,
                ),
                topContainer(
                  "Johar Town",
                  160,
                  clr: secondaryColor,
                  textClr: primaryColor,
                )
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: "Showing: ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: "Results for See All Pets",
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        const Text("Sort By",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationZ(1.5708),
                          child: const Icon(Icons.compare_arrows),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            // StreamBuilder to fetch products from Firebase

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Animals')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return const Center(child: Text("Something went wrong"));
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text("No Animals available"));
                  }

                  var products = snapshot.data!.docs;

                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // Set the number of columns
                      crossAxisSpacing: 5,
                      // Horizontal space between items
                      mainAxisSpacing: 5,
                      // Vertical space between items
                      childAspectRatio: 0.6,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      var product = products[index];
                      var imageUrl = product['image'][0]; // First image URL
                      var name = product['name'];
                      var breed = product['breed'];
                      var location = product[
                          'category']; // Assuming 'category' is location
                      var price = product['price'];

                      return Row(
                        children: [
                          adsTemplate(
                            imageUrl: imageUrl,
                            name: name,
                            breed: breed,
                            location: location,
                            price: price,
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
