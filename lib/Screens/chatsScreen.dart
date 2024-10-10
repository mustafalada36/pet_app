import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:pet_app/Screens/profileScreen.dart';
import 'package:pet_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/components/body.dart';

import 'adDetails.dart';
import 'homeScreen.dart';
import 'myAds.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int _currentIndex = 1;
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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => myAds()));
        
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
      appBar: buildAppBar(),
      body: const Body(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: kPrimaryColor,
      //   child: const Icon(
      //     Icons.person_add_alt_1,
      //     color: Colors.white,
      //   ),
      // ),
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

// BottomNavigationBar buildBottomNavigationBar() {
//   return BottomNavigationBar(
//     type: BottomNavigationBarType.fixed,
//     currentIndex: _selectedIndex,
//     onTap: (value) {
//       setState(() {
//         _selectedIndex = value;
//       });
//     },

// items: const [
//   BottomNavigationBarItem(icon: Icon(Icons.messenger), label: "Chats"),
//   BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
//   BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
//   BottomNavigationBarItem(
//     icon: CircleAvatar(
//       radius: 14,
//       backgroundImage: AssetImage("assets/images/user_2.png"),
//     ),
//     label: "Profile",
//   ),
// ],
}

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: kPrimaryColor,
    automaticallyImplyLeading: false,
    title: const Text("Chats"),
  );
}
