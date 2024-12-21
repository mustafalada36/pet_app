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

              return ListTile(
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
              );
            },
          );
        },
      ),
    );
  }
}

