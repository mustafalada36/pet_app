import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/Reuseable%20Components/adsTemplate.dart';
import 'package:pet_app/Reuseable%20Components/topContainer.dart';
import '../constants.dart';

class seeAllMaintainance extends StatelessWidget {
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
                  hintText: 'Search Pet Maintainance',
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
                  "Maintainance",
                  screenWidth * 0.47, // Dynamic width
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Showing: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Results for See All Maintainance",
                        ),
                      ],
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
                    .collection('Maintainance')
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

                  var Maintainance = snapshot.data!.docs;

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Responsive
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.52,
                    ),
                    itemCount: Maintainance.length,
                    itemBuilder: (context, index) {
                      var maintainance = Maintainance[index];
                      var imageUrl = maintainance['image'][0];
                      var name = maintainance['name'];
                      var workHours = maintainance['workHours'];
                      var location = maintainance['location'];
                      var priceRange = maintainance['priceRange'];

                      var adId = maintainance.id; // Document ID

                      return adsTemplate(
                          imageUrl: imageUrl,
                          name: name,
                          species: workHours,
                          price: priceRange,
                          location: location,
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
