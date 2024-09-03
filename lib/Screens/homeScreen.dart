import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/Screens/loginscreen.dart';

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
        // Navigate to Home page or perform any action
        break;
      case 1:
        print("Chat tapped");
        // Navigate to Chat page or perform any action
        break;
      case 2:
        print("Post Ad tapped");
        // Navigate to Post Ad page or perform any action
        break;
      case 3:
        print("My Ads tapped");
        // Navigate to My Ads page or perform any action
        break;
      case 4:
        print("Profile tapped");
        // Navigate to Profile page or perform any action
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
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
            Expanded(
              child: _pages[_currentIndex],
            ),
            // Add more widgets below the search bar if needed
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.chat, size: 30, color: Colors.white),
          Icon(Icons.add, size: 30, color: Colors.white),
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
