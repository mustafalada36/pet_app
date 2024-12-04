import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_app/Screens/adDetails.dart';
import 'package:pet_app/Screens/blogs.dart';
import 'package:pet_app/Screens/getStarted.dart';
import 'package:pet_app/Screens/loginscreen.dart';
import 'package:pet_app/Screens/myAds.dart';
import 'package:pet_app/Screens/profileScreen.dart';
import 'package:pet_app/Screens/seeAllFood.dart';
import 'package:pet_app/Screens/seeAllMaintainance.dart';
import 'package:pet_app/Screens/seeAllMedical.dart';
import 'package:pet_app/Screens/seeAllPets.dart';
import 'package:pet_app/Screens/temporary.dart';
import 'package:pet_app/constants.dart';
import 'package:pet_app/models/Chat.dart';

import '../Reuseable Components/adsTemplate.dart';
import 'chatsScreen.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int _currentIndex = 0;
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

    switch (index) {
      case 0:
        print("Home tapped");
        // Remove pushReplacement for homeScreen to avoid infinite push.
        break;
      case 1:
        print("Chat tapped");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ChatsScreen()),
        );
        break;
      case 2:
        print("Post Ad tapped");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => adDetails()),
        );
        break;
      case 3:
        print("My Ads tapped");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => myAds()),
        );
        break;
      case 4:
        print("Profile tapped");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => profileScreen()),
        );
        break;
      default:
        print("Unknown tab");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.shopping_cart, color: Color(0xff267E1E)),
          onPressed: () {
            // Add action for the shopping cart icon
          },
        ),
        title: const Center(
          child: const Text(
            'Pet App',
            style:
                TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => blogs(),
                )),
            icon: Icon(Icons.post_add),
            color: primaryColor,
          ),
          IconButton(
            icon: const Icon(Icons.person_rounded, color: Color(0xff267E1E)),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => profileScreen(),
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              // SEARCH BUTTON=====================================
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Pets',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff013220),
                        Color(0xff39ff14),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Find the best pet',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      ' in your Location ',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow
                                          .ellipsis, // Ensures text doesn't overflow
                                    ),
                                  ),
                                  const Icon(
                                    Icons.place,
                                    color: Colors.white,
                                    size: 23,
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size.square(12),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 13, vertical: 7),
                                ),
                                child: const Text(
                                  'View All',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Lottie.asset(
                                'assets/animation/anim2.json',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Categories',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w800),
                          ),
                          Text(
                            'See All',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => seeAllPets()),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/buynsell.png',
                                    fit: BoxFit.cover,
                                    width: 60,
                                    height: 60,
                                  ),
                                  const Text(
                                    'Buy & Sell \n     ',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => seeAllFood()),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/foodpet.png',
                                    fit: BoxFit.cover,
                                    width: 60,
                                    height: 70,
                                  ),
                                  const Text(
                                    'Pet Food \n     ',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        seeAllMaintainance()),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/maintain.png',
                                    fit: BoxFit.cover,
                                    width: 60,
                                    height: 60,
                                  ),
                                  const Text(
                                    '         Pet\n Maintainance',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/images/doctor.png',
                                  fit: BoxFit.cover,
                                  width: 60,
                                  height: 60,
                                ),
                                const Text(
                                  '   Medical\n Consultation',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => blogs()),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/adopt.png',
                                    fit: BoxFit.cover,
                                    width: 60,
                                    height: 60,
                                  ),
                                  const Text(
                                    '  Community',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Buy & Sell',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w800),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => seeAllPets()),
                            ),
                            child: Text(
                              'See All',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w800),
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('Animals')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }

                                if (snapshot.hasError) {
                                  return const Center(
                                      child: Text("Something went wrong"));
                                }

                                if (!snapshot.hasData ||
                                    snapshot.data!.docs.isEmpty) {
                                  return const Center(
                                      child: Text("No Animals available"));
                                }

                                var Animals = snapshot.data!.docs;

                                return SizedBox(
                                  height: 300,
                                  width: 500,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
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
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Pet Food',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w800),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => seeAllFood()),
                            ),
                            child: Text(
                              'See All',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w800),
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('Food')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }

                                if (snapshot.hasError) {
                                  return const Center(
                                      child: Text("Something went wrong"));
                                }

                                if (!snapshot.hasData ||
                                    snapshot.data!.docs.isEmpty) {
                                  return const Center(
                                      child: Text("No Animals available"));
                                }

                                var Food = snapshot.data!.docs;

                                return SizedBox(
                                  height: 300,
                                  width: 500,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: Food.length,
                                    itemBuilder: (context, index) {
                                      var food = Food[index];
                                      var imageUrl = food['image'][0];
                                      var name = food['name'];
                                      var species = food['species'];
                                      var location = food['location'];
                                      var price = food['price'];
                                      var adId = food.id; // Document ID

                                      return adsTemplate(
                                          imageUrl: imageUrl,
                                          name: name,
                                          species: species,
                                          location: location,
                                          price: price,
                                          adId: adId // Pass adId here
                                          );
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Pet Maintainance',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w800),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => seeAllMaintainance()),
                            ),
                            child: Text(
                              'See All',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w800),
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('Maintainance')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }

                                if (snapshot.hasError) {
                                  return const Center(
                                      child: Text("Something went wrong"));
                                }

                                if (!snapshot.hasData ||
                                    snapshot.data!.docs.isEmpty) {
                                  return const Center(
                                      child: Text("No Animals available"));
                                }

                                var Maintainance = snapshot.data!.docs;

                                return SizedBox(
                                  height: 300,
                                  width: 500,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: Maintainance.length,
                                    itemBuilder: (context, index) {
                                      var maintainance = Maintainance[index];
                                      var imageUrl = maintainance['image'][0];
                                      var name = maintainance['name'];
                                      var workHours =
                                          maintainance['workHours'];
                                      var location = maintainance['location'];
                                      var priceRange =
                                          maintainance['priceRange'];

                                      var adId =
                                          maintainance.id; // Document ID

                                      return adsTemplate(
                                          imageUrl: imageUrl,
                                          name: name,
                                          species: workHours,
                                          price: priceRange,
                                          location: location,
                                          adId: adId // Pass adId here
                                          );
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Pet Medical',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w800),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => seeAllMedical()),
                            ),
                            child: Text(
                              'See All',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w800),
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('Medical')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }

                                if (snapshot.hasError) {
                                  return const Center(
                                      child: Text("Something went wrong"));
                                }

                                if (!snapshot.hasData ||
                                    snapshot.data!.docs.isEmpty) {
                                  return const Center(
                                      child: Text("No Animals available"));
                                }

                                var Medical = snapshot.data!.docs;

                                return SizedBox(
                                  height: 300,
                                  width: 500,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: Medical.length,
                                    itemBuilder: (context, index) {
                                      var medical = Medical[index];
                                      var imageUrl = medical['image'][0];
                                      var name = medical['name'];
                                      var fee = medical['fee'];
                                      var location = medical['location'];
                                      var appTime = medical['appTime'];

                                      var adId = medical.id; // Document ID

                                      return adsTemplate(
                                          imageUrl: imageUrl,
                                          name: name,
                                          species: appTime,
                                          price: fee,
                                          location: location,
                                          adId: adId // Pass adId here
                                          );
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      //BOTTOM NAV BAR ======================================================================
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        items: <Widget>[
          const Icon(Icons.home, size: 30, color: Colors.white),
          const Icon(Icons.chat, size: 30, color: Colors.white),
          const Icon(Icons.add_circle_outline, size: 40, color: Colors.white),
          const Icon(Icons.list_alt, size: 30, color: Colors.white),
          const Icon(Icons.person, size: 30, color: Colors.white),
        ],
        onTap: _onItemTapped,
        color: Colors.green,
        buttonBackgroundColor: Colors.green.shade700,
        height: 60,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        index: _currentIndex,
      ),
    );
  }
}
