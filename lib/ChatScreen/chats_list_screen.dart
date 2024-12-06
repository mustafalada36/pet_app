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
  const ChatsListScreen({Key? key}) : super(key: key);

  @override
  State<ChatsListScreen> createState() => _ChatsListScreenState();
}

class _ChatsListScreenState extends State<ChatsListScreen> {
  final String? currentUserId = FirebaseAuth.instance.currentUser?.uid;
  int _currentIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => homeScreen()));
        break;
      case 1:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ChatsListScreen()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => adDetails()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => myAds()));
        break;
      case 4:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => profileScreen()));
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          "Chats",
          style: TextStyle(color: Colors.white), // Set title text color to white
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),

        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('chats')
              .where('participants', arrayContains: currentUserId)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            // Get the chat documents
            final chatDocs = snapshot.data!.docs;

            // Remove duplicates based on chatId
            final uniqueChats = {
              for (var chat in chatDocs) chat.id: chat
            }.values.toList();

            if (uniqueChats.isEmpty) {
              return Center(child: Text("No chats available"));
            }

            return  ListView.builder(
              itemCount: uniqueChats.length,
              itemBuilder: (context, index) {
                final chat = uniqueChats[index];
                final participants = List<String>.from(chat['participants']);
                final otherUserId = participants.firstWhere(
                      (id) => id != currentUserId,
                  orElse: () => 'Unknown User', // Provide a fallback value
                );
                final lastMessage = chat['lastMessage'] ?? "No messages yet";

                return ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.chat),
                  ),
                  title: Text("Chat with ${otherUserId != 'Unknown User' ? otherUserId : 'Unknown'}"),
                  subtitle: Text(lastMessage),
                  onTap: otherUserId != 'Unknown User'
                      ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(
                          adId: chat['adId'],
                          adOwnerId: otherUserId,
                        ),
                      ),
                    );
                  }
                      : null, // Disable navigation if the other user is unknown
                );
              },
            );

          },
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
}
