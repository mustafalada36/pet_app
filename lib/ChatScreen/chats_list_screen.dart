import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Screens/adDetails.dart';
import '../Screens/homeScreen.dart';
import '../Screens/myAds.dart';
import '../Screens/profileScreen.dart';
import '../constants.dart';
import 'chat_screen.dart';

class ChatsListScreen extends StatefulWidget {
  @override
  State<ChatsListScreen> createState() => _ChatsListScreenState();
}

class _ChatsListScreenState extends State<ChatsListScreen> {
  final String? currentUserId = FirebaseAuth.instance.currentUser?.uid;

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
            context, MaterialPageRoute(builder: (context) => ChatsListScreen()));
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
            MaterialPageRoute(builder: (context) => profileScreen()));
        break;
      default:
        print("Unknown tab");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Chats",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Chats')
            .where('participants', arrayContains: currentUserId)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final chatDocs = snapshot.data!.docs;

          if (chatDocs.isEmpty) {
            return Center(child: Text("No chats available"));
          }

          return ListView.builder(
            itemCount: chatDocs.length,
            itemBuilder: (context, index) {
              final chat = chatDocs[index];
              final participants = List<String>.from(chat['participants']);
              final otherUserId = participants.firstWhere((id) => id != currentUserId);
              final lastMessage = chat['lastMessage'] ?? "No messages yet";

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0), // Top and bottom padding
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF31EE21).withOpacity(0.16), // 16% opacity
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.chat),
                    ),
                    title: Text("Chat with ${otherUserId}"),
                    subtitle: Text(lastMessage),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(
                            adId: chat['adId'],
                            adOwnerId: otherUserId,
                            chatId: chat.id, // Pass the chatId
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );


            },
          );
        },
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

