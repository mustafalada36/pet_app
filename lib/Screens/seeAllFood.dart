import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/Reuseable%20Components/topContainer.dart';
import '../Reuseable Components/adsTemplate2.dart';
import '../constants.dart';
import 'homeScreen.dart';

class seeAllFood extends StatefulWidget {
  @override
  State<seeAllFood> createState() => _seeAllFoodState();
}

class _seeAllFoodState extends State<seeAllFood> {
  //Seach func
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
                hintText: 'Search Food',
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
                  "Food",
                  screenWidth * 0.3, // Dynamic width
                  image: Image.asset("assets/images/activeSymbol.png"),
                  clr: primaryColor,
                  textClr: Colors.white,
                ),
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
                            text: "Results for See All Food",
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
                stream:
                    FirebaseFirestore.instance.collection('Food').snapshots(),
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

                  // Filter data based on search query
                  var Food = snapshot.data!.docs.where((doc) {
                    var name = (doc['name'] as String).toLowerCase();
                    return name.contains(_searchText);
                  }).toList();

                  if (Food.isEmpty) {
                    return const Center(child: Text("No matching results"));
                  }

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Responsive
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.52,
                    ),
                    itemCount: Food.length,
                    itemBuilder: (context, index) {
                      var food = Food[index];
                      var imageUrl = food['image'][0];
                      var name = food['name'];
                      var species = food['species'];
                      var location = food['location'];
                      var price = food['price'];
                      var adId = food.id; // Document ID

                      return adsTemplate2(
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
