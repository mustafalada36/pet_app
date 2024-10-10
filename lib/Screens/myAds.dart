import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/Reuseable%20Components/topActiveContainer.dart';
import 'package:pet_app/Screens/favourites.dart';
import 'package:pet_app/Screens/profileScreen.dart';
import 'package:pet_app/constants.dart';

import 'adDetails.dart';
import 'chatsScreen.dart';
import 'homeScreen.dart';

class myAds extends StatefulWidget {
  @override
  State<myAds> createState() => _myAdsState();
}

class _myAdsState extends State<myAds> {
  int _currentIndex = 3;
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
          centerTitle: true,
          title: Text(
            "My Ads",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: primaryColor),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              topActiveContainer("Ads", 120),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CircleAvatar(
                  backgroundColor: primaryColor,
                  child: Text(
                    "1",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          adsCard(), // From Favourites Screen
        ],
      ),
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
