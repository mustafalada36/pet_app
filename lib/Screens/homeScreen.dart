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
import 'package:pet_app/Screens/myCart.dart';
import 'package:pet_app/Screens/profileScreen.dart';
import 'package:pet_app/Screens/seeAllFood.dart';
import 'package:pet_app/Screens/seeAllMaintainance.dart';
import 'package:pet_app/Screens/seeAllMedical.dart';
import 'package:pet_app/Screens/seeAllPets.dart';
import 'package:pet_app/Screens/temporary.dart';
import 'package:pet_app/constants.dart';
import 'package:pet_app/models/Chat.dart';

/*<<<<<<< Updated upstream*/
import '../Other Services/current_location.dart';
/*=======*/
import '../ChatScreen/chat_screen.dart';
import '../ChatScreen/chats_list_screen.dart';
/*>>>>>>> Stashed changes*/
import '../Reuseable Components/adsTemplate.dart';
import '../Reuseable Components/adsTemplate2.dart';
import '../Reuseable Components/adsTemplate3.dart';
import '../Reuseable Components/adsTemplate4.dart';
import 'chatsScreen.dart';
import 'editProfile.dart';

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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatsListScreen()),
        );
        break;
      case 2:
        print("Post Ad tapped");
        Navigator.pushReplacement(
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.shopping_cart, color: Color(0xff267E1E)),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => myCart(),
                ));
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
            onPressed: () => Navigator.pushReplacement(
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search Pets',
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
                                      cityName.isNotEmpty
                                          ? "in $cityName" // Display fetched city name
                                          : ' in your Location ',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow
                                          .ellipsis, // Ensures text doesn't overflow
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.place,
                                  color: Colors.white,
                                  size: 23,
                                ),
                                onPressed: () async {
                                  // Navigate to CurrentLocation screen and get the selected city
                                  final selectedCity = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CurrentLocation(),
                                    ),
                                  );
                                  // If a city is selected, update the cityName
                                  if (selectedCity != null) {
                                    setState(() {
                                      cityName = selectedCity;
                                    });
                                  }
                                },
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => seeAllPets(),
                                      ));
                                },
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
                              onTap: () => Navigator.pushReplacement(
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

                          // Filter data based on search query
                          var animals = snapshot.data!.docs.where((doc) {
                            var name = (doc['name'] as String).toLowerCase();
                            return name.contains(_searchText);
                          }).toList();

                          if (animals.isEmpty) {
                            return const Center(
                                child: Text("No matching results"));
                          }

                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.35,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: animals.length,
                              itemBuilder: (context, index) {
                                var animal = animals[index];
                                return adsTemplate(
                                  imageUrl: animal['image'][0],
                                  name: animal['name'],
                                  species: animal['species'],
                                  location: animal['location'],
                                  price: animal['price'],
                                  adId: animal.id,
                                );
                              },
                            ),
                          );
                        },
                      )
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
                                child: Text(
                                    "No Food available")); // Changed text to match collection
                          }

                          // Filter data based on search query
                          var foods = snapshot.data!.docs.where((doc) {
                            var name = (doc['name'] as String).toLowerCase();
                            return name.contains(_searchText);
                          }).toList();

                          if (foods.isEmpty) {
                            return const Center(
                                child: Text("No matching results"));
                          }

                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.35,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: foods.length,
                              itemBuilder: (context, index) {
                                var food = foods[index];

                                return adsTemplate2(
                                  imageUrl: food['image'][0],
                                  name: food['name'] ?? '',
                                  species: food['species'] ?? '',
                                  location: food['location'] ?? '',
                                  price: food['price'] ?? 0,
                                  adId: food.id,
                                );
                              },
                            ),
                          );
                        },
                      )
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
                                child: Text(
                                    "No Maintenance available")); // Fixed text
                          }

                          // Filter data based on search query
                          var maintenanceService =
                              snapshot.data!.docs.where((doc) {
                            var name = (doc['name'] as String).toLowerCase();
                            return name.contains(_searchText);
                          }).toList();

                          if (maintenanceService.isEmpty) {
                            return const Center(
                                child: Text("No matching results"));
                          }

                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.35,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: maintenanceService.length,
                              itemBuilder: (context, index) {
                                var maintainance = maintenanceService[index];

                                return adsTemplate3(
                                  imageUrl: maintainance['image'][0],
                                  name: maintainance['name'] ?? '',
                                  workHours: maintainance['workHours'] ?? '',
                                  location: maintainance['location'] ?? '',
                                  price: maintainance['priceRange'] ?? 0,
                                  adId: maintainance.id,
                                );
                              },
                            ),
                          );
                        },
                      )
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
                                child: Text("No Medical services available"));
                          }

                          // Filter data based on search query
                          var medicalServices =
                              snapshot.data!.docs.where((doc) {
                            var name = (doc['name'] as String).toLowerCase();
                            name = (doc['doctor'] as String).toLowerCase();
                            return name.contains(_searchText);
                          }).toList();

                          if (medicalServices.isEmpty) {
                            return const Center(
                                child: Text("No matching results"));
                          }

                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.38,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: medicalServices.length,
                              itemBuilder: (context, index) {
                                var medical = medicalServices[index];

                                return adsTemplate4(
                                  imageUrl: medical['image'][0],
                                  name: medical['name'] ?? '',
                                  doctor: medical['doctor'] ?? '',
                                  workHours: medical['appTime'] ?? '',
                                  location: medical['location'] ?? '',
                                  price: medical['fee'] ?? 0,
                                  adId: medical.id,
                                );
                              },
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action here
          print('Floating Button Pressed');
        },
        backgroundColor: primaryColor,
        elevation: 0,
        child: ClipOval(
          child: Lottie.asset(
            'assets/animation/anim6.json',
            // Replace with your image path
            fit: BoxFit.cover, // Ensure the image fits well
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
