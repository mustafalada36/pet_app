import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'adDetails.dart';
import 'chatsScreen.dart';
import 'homeScreen.dart';
import 'myAds.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Color primaryColor = Color(0xFF267E1E);
  final Color containerColor = Color(0xFFD9D9D9);

  int _currentIndex = 4;
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
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
        child: Column(
          children: [
            // First Row: Image and Profile Info
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Circular Image with Color
                Container(
                  width: 73,
                  height: 73,
                  decoration: BoxDecoration(
                    color: containerColor,
                    shape: BoxShape.circle, // Circle shape
                  ),
                  child: Center(
                    child: Icon(
                      Icons.person,
                      color: primaryColor, // Primary color for the icon
                      size: 50,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                // Profile Info (Aligned like Favorites & Saved searches)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name "James"
                      Text(
                        'James',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w600, // Semibold
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 4),
                      // "View and edit profile" button
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'View and edit profile',
                          style: TextStyle(
                            color: primaryColor,
                            decoration: TextDecoration.underline,
                            // Underline text
                            fontSize: 14,
                          ),
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.zero, // Remove padding for alignment
                          ),
                          minimumSize: MaterialStateProperty.all(
                              Size(0, 0)), // Min size for alignment
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16), // Spacing between rows
            // First Row: Favorites & Saved Searches
            _buildProfileRow(
              icon: Icons.favorite_border,
              title: 'Favorites & Saved searches',
              subtitle: 'All of your favorite ads & saved filters',
            ),
            Divider(color: primaryColor),
            SizedBox(height: 16),
            // Second Row: Recently Viewed
            _buildProfileRow(
              icon: Icons.history,
              title: 'Recently Viewed',
              subtitle: 'Check the ads you viewed recently',
            ),
            Divider(color: primaryColor),
            SizedBox(height: 16),
            // Third Row: Notifications
            _buildProfileRow(
              icon: Icons.notifications_none,
              title: 'Notifications',
              subtitle: 'Manage your notifications',
            ),
            Divider(color: primaryColor),
            SizedBox(height: 16),
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
        SizedBox(width: 16),
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
              SizedBox(height: 4),
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
