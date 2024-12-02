import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/Reuseable%20Components/adsTemplate.dart';
import 'package:pet_app/Reuseable%20Components/topContainer.dart';
import '../constants.dart';

class seeAllPets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
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
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                topContainer(
                  "Pets",
                  screenWidth * 0.3, // Dynamic width
                  image: Image.asset("assets/images/activeSymbol.png"),
                  clr: primaryColor,
                  textClr: Colors.white,
                ),
                /*topContainer(
                  "Johar Town",
                  screenWidth * 0.5, // Dynamic width
                  clr: secondaryColor,
                  textClr: primaryColor,
                ),*/
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Showing: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "Results for See All Pets",
                          ),
                        ],
                      ),
                      softWrap: true,
                    ),
                  ),
                  Row(
                    children: [
                      const Text("Sort By",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationZ(1.5708),
                        child: const Icon(Icons.compare_arrows),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
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

                  var Animals = snapshot.data!.docs;

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: screenWidth < 600 ? 2 : 3, // Responsive
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: screenWidth < 600 ? 0.6 : 0.65,
                    ),
                    itemCount: Animals.length,
                    itemBuilder: (context, index) {
                      var animal = Animals[index];
                      var imageUrl = animal['image'][0];
                      var name = animal['name'];
                      var species = animal['species'];
                      var location = animal['location'];
                      var price = animal['price'];
                      var adId = animal.id; // Document ID

                      return adsTemplate(
                          imageUrl: imageUrl,
                          name: name,
                          species: species,
                          location: location,
                          price: price,
                          adId: adId // Pass adId here
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
