import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/Screens/adDetails.dart';
import 'package:pet_app/Screens/getStarted.dart';
import 'package:pet_app/Screens/loginscreen.dart';
import 'package:pet_app/Screens/myAds.dart';
import 'package:pet_app/Screens/profileScreen.dart';
import 'package:pet_app/Screens/seeAllFood.dart';
import 'package:pet_app/Screens/seeAllPets.dart';
import 'package:pet_app/Screens/temporary.dart';
import 'package:pet_app/constants.dart';
import 'package:pet_app/models/Chat.dart';

import 'chatsScreen.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  final String? userId = FirebaseAuth.instance.currentUser?.uid;

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
            icon: const Icon(Icons.person_rounded, color: Color(0xff267E1E)),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => profileScreen(),
                )),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color(0xff267E1E),
              ),
              child: Stack(children: [
                // FEATURED CONTAINER =====================================
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 70, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Find the best pet',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const Row(
                        children: [
                          Text(
                            ' in your Location ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
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
                            // Width and height
                            padding: const EdgeInsets.symmetric(
                                horizontal: 13, vertical: 7),
                          ),
                          child: const Text(
                            'View All',
                            style: TextStyle(fontSize: 10),
                          ))
                    ],
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 35,
                  child: Image.asset(
                    'assets/images/girldog.png',
                  ),
                ),
              ]),
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
                                'assets/images/buysell.jpg',
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
                                'assets/images/petfood.jpg',
                                fit: BoxFit.cover,
                                width: 60,
                                height: 60,
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
                        Column(
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
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/adopt.png',
                              fit: BoxFit.cover,
                              width: 60,
                              height: 60,
                            ),
                            const Text(
                              '      Pet\n Adoption',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/medical.jpg',
                              fit: BoxFit.cover,
                              width: 60,
                              height: 60,
                            ),
                            const Text(
                              '   Medical\n Consultation',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text('userid is: $userId'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _pages[_currentIndex],
            ),
          ],
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
