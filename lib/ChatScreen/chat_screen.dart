import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class ChatScreen extends StatefulWidget {
  final String adId;
  final String adOwnerId;
  final String chatId; // Accept chatId as a parameter

  ChatScreen({required this.adId, required this.adOwnerId, required this.chatId});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final String? currentUserId = FirebaseAuth.instance.currentUser?.uid;

  void _sendMessage() async {
    if (_controller.text.trim().isEmpty) return;

    final message = _controller.text.trim();

    // Send message to Firestore
    await FirebaseFirestore.instance
        .collection('Chats')
        .doc(widget.chatId)
        .collection('Messages')
        .add({
      'senderId': currentUserId,
      'receiverId': widget.adOwnerId,
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
    });

    // Update chat metadata
    await FirebaseFirestore.instance.collection('Chats').doc(widget.chatId).set({
      'adId': widget.adId,
      'participants': [currentUserId, widget.adOwnerId],
      'lastMessage': message,
      'lastUpdated': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat with Ad Owner"),
        backgroundColor: secondaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Chats')
                  .doc(widget.chatId)
                  .collection('Messages')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                final messages = snapshot.data!.docs;

                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final isMe = message['senderId'] == currentUserId;

                    return Align(
                      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        padding: EdgeInsets.all(10),
                        color: isMe ? Colors.blue[100] : Colors.grey[300],
                        child: Text(message['message']),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
