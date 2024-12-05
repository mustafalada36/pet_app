import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/Reuseable%20Components/primaryButton.dart';
import 'package:pet_app/Screens/editProfile.dart';
import 'package:pet_app/Screens/loginscreen.dart';
import 'package:pet_app/Screens/orderPlaced.dart';
import 'package:pet_app/constants.dart';

import '../Firebase_services/authetication.dart';
import 'adDetails.dart';
import 'chatsScreen.dart';
import 'homeScreen.dart';
import 'myAds.dart';

class profileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<profileScreen> {
  final String? userId = FirebaseAuth.instance.currentUser?.uid;
  final String? email = FirebaseAuth.instance.currentUser?.email;
  final Color primaryColor = const Color(0xFF267E1E);
  final Color containerColor = const Color(0xFFD9D9D9);

  int _currentIndex = 4;

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

    // Here you can define the action when an item is tapped
    switch (index) {
      case 0:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const homeScreen()));
        break;
      case 1:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const ChatsScreen()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => adDetails()));

      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => myAds()));

      case 4:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => profileScreen()));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 50),
          child: Column(
            children: [
              // First Row: Image and Profile Info
              Container(
                width: double.infinity,
                child: Card(
                  color: secondaryColor,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Circular Image with Color
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              color: containerColor,
                              shape: BoxShape.circle, // Circle shape
                            ),
                            child: Center(
                              child: Icon(
                                Icons.person,
                                color: primaryColor,
                                // Primary color for the icon
                                size: 50,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Profile Info (Aligned like Favorites & Saved searches)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Name "James"
                              Text(
                                'Haseeb',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600,
                                  // Semibold
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Gmail: $email',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w400,
                                  // Semibold
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Phone: ',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w400,
                                  // Semibold
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'UserId: $userId',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w400,
                                  // Semibold
                                  fontSize: 10,
                                ),
                              ),
                              const SizedBox(height: 4),
                              // "View and edit profile" button
                              TextButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  padding:
                                      WidgetStateProperty.all<EdgeInsets>(
                                    EdgeInsets
                                        .zero, // Remove padding for alignment
                                  ),
                                  minimumSize: WidgetStateProperty.all(
                                      const Size(
                                          0, 0)), // Min size for alignment
                                ),
                                child: InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => editProfile(),
                                      )),
                                  child: Text(
                                    'Click to edit profile',
                                    style: TextStyle(
                                      color: primaryColor,
                                      decoration: TextDecoration.underline,
                                      // Underline text
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 40, bottom: 0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    // Use primaryColor
                                    foregroundColor: Colors.white,
                                    // Text color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          20), // Rounded corners
                                    ),
                                    minimumSize: const Size(70, 30),
                                  ),
                                  onPressed: () async {
                                    await AuthServices().signOut();
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => loginScreen(),
                                        ));
                                  },
                                  child: const Text('Logout'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  primaryButton(
                      170,
                      "My Orders",
                      () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => orderPlacedScreen(),
                          ))),
                  primaryButton(
                      170,
                      "Orders Sold",
                      () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => orderPlacedScreen(),
                          ))),
                ],
              ),

              const SizedBox(height: 41), // Spacing between rows

              _buildProfileRow(
                icon: Icons.favorite_border,
                title: 'Favorites & Saved searches',
                subtitle: 'All of your favorite ads & saved filters',
              ),
              Divider(color: primaryColor),
              const SizedBox(height: 41),
              // Second Row: Recently Viewed
              _buildProfileRow(
                icon: Icons.history,
                title: 'Recently Viewed',
                subtitle: 'Check the ads you viewed recently',
              ),
              Divider(color: primaryColor),
              const SizedBox(height: 41),
              // Third Row: Notifications
              _buildProfileRow(
                icon: Icons.notifications_none,
                title: 'Notifications',
                subtitle: 'Manage your notifications',
              ),
              Divider(color: primaryColor),
              const SizedBox(height: 41),
              // Fourth Row: Settings
              _buildProfileRow(
                icon: Icons.settings_outlined,
                title: 'Settings',
                subtitle: 'Customize your preferences',
              ),
              Divider(color: primaryColor), // Divider after the 4th row
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        items: const <Widget>[
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
        animationDuration: const Duration(milliseconds: 600),
        index: _currentIndex,
      ),
    );
  }

  // Helper method to build each row
  Widget _buildProfileRow(
      {required IconData icon,
      required String title,
      required String subtitle}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon on the left
        Icon(
          icon,
          color: primaryColor,
          size: 28,
        ),
        const SizedBox(width: 16),
        // Text Section
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                title,
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w500, // Medium weight
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              // Subtitle
              Text(
                subtitle,
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w400, // Regular weight
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        // Next Icon on the right
        Icon(
          Icons.arrow_forward_ios,
          color: primaryColor,
          size: 20,
        ),
      ],
    );
  }
}
