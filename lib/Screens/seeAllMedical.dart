import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/Reuseable%20Components/adsTemplate.dart';
import 'package:pet_app/Reuseable%20Components/adsTemplate4.dart';
import 'package:pet_app/Reuseable%20Components/topContainer.dart';
import '../constants.dart';
import 'homeScreen.dart';

class seeAllMedical extends StatefulWidget {
  @override
  State<seeAllMedical> createState() => _seeAllMedicalState();
}

class _seeAllMedicalState extends State<seeAllMedical> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Medical Services',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchText =
                      value.toLowerCase(); // Normalize text for search
                });
              },
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => homeScreen(),
                ));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: primaryColor,
            size: 30,
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
                  "Medical",
                  screenWidth * 0.47, // Dynamic width
                  image: Image.asset("assets/images/activeSymbol.png"),
                  clr: primaryColor,
                  textClr: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Showing: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Results for See All Medical",
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
            const SizedBox(height: 10),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Medical')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return const Center(child: Text("Something went wrong"));
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text("No Medical available"));
                  }

                  // Filter data based on search query
                  var Medical = snapshot.data!.docs.where((doc) {
                    var name = (doc['name'] as String).toLowerCase();
                    return name.contains(_searchText);
                  }).toList();

                  if (Medical.isEmpty) {
                    return const Center(child: Text("No matching results"));
                  }

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Responsive
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.52,
                    ),
                    itemCount: Medical.length,
                    itemBuilder: (context, index) {
                      var medical = Medical[index];
                      var imageUrl = medical['image'][0];
                      var name = medical['name'];
                      var fee = medical['fee'];
                      var location = medical['location'];
                      var appTime = medical['appTime'];
                      var doctor = medical['doctor'];

                      var adId = medical.id; // Document ID

                      return adsTemplate4(
                        imageUrl: imageUrl,
                        name: name,
                        workHours: appTime,
                        price: fee,
                        location: location,
                        adId: adId,
                        doctor: doctor, // Pass adId here
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
