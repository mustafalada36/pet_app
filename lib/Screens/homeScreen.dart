import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/Screens/adDetails.dart';
import 'package:pet_app/Screens/loginscreen.dart';
import 'package:pet_app/Screens/myAds.dart';
import 'package:pet_app/Screens/profileScreen.dart';
import 'package:pet_app/models/Chat.dart';

import 'chatsScreen.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    Center(child: Text('Home Screen')),
    Center(child: Text('Chat Screen')),
    Center(child: Text('Post Ad Screen')),
    Center(child: Text('My Ads Screen')),
    Center(child: Text('Profile Screen')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Here you can define the action when an item is tapped
    switch (index) {
      case 0:
        print("Home tapped");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => homeScreen()));
        break;
      case 1:
        print("Chat tapped");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ChatsScreen()));
        break;
      case 2:
        print("Post Ad tapped");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => adDetails()));
        
      case 3:
        print("My Ads tapped");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => myAds()));
        break;
      case 4:
        print("Profile tapped");
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ProfileScreen()));
        break;
      default:
        print("Unknown tab");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // HEAD ===================================================
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.shopping_cart, color: Color(0xff267E1E)),
          onPressed: () {
            // Add action for the shopping cart icon
          },
        ),
        title: Center(
          child: Text(
            'Location',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person_rounded, color: Color(0xff267E1E)),
            onPressed: () {
              // Add action for the profile icon
            },
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
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color(0xff267E1E),
              ),
              child: Stack(children: [
                // FEATURED CONTAINER =====================================
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 70, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Find the best pet',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Row(
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
                            minimumSize: Size.square(12), // Width and height
                            padding: EdgeInsets.symmetric(
                                horizontal: 13, vertical: 7),
                          ),
                          child: Text(
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
                  Row(
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
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/buysell.jpg',
                              fit: BoxFit.cover,
                              width: 60,
                              height: 60,
                            ),
                            Text(
                              'Buy & Sell \n     ',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/petfood.jpg',
                              fit: BoxFit.cover,
                              width: 60,
                              height: 60,
                            ),
                            Text(
                              'Pet Food \n     ',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        SizedBox(
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
                            Text(
                              '         Pet\n Maintainance',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        SizedBox(
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
                            Text(
                              '      Pet\n Adoption',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        SizedBox(
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
                            Text(
                              '   Medical\n Consultation',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
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
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.chat, size: 30, color: Colors.white),
          Icon(Icons.add_circle_outline, size: 40, color: Colors.white),
          Icon(Icons.list_alt, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        onTap: _onItemTapped,
        color: Colors.green,
        buttonBackgroundColor: Colors.green.shade700,
        height: 60,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        index: _currentIndex,
      ),
    );
  }
}
