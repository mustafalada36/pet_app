import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class ChatScreen extends StatefulWidget {
  final String adId;
  final String adOwnerId;

  ChatScreen({required this.adId, required this.adOwnerId});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final String? currentUserId = FirebaseAuth.instance.currentUser?.uid;

  // Function to send message
  void _sendMessage() async {
    if (_controller.text.trim().isEmpty) return;

    final message = _controller.text.trim();
    final chatId = "${widget.adId}_${currentUserId}_${widget.adOwnerId}";

    // Send the message to Firestore
    await FirebaseFirestore.instance
        .collection('Chats')
        .doc(chatId)
        .collection('Messages')
        .add({
      'senderId': currentUserId,
      'receiverId': widget.adOwnerId,
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
    });

    // Update metadata for the chat
    await FirebaseFirestore.instance.collection('Chats').doc(chatId).set({
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
        backgroundColor: secondaryColor, // Apply the secondary color here
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Chats')
                  .doc("${widget.adId}_${currentUserId}_${widget.adOwnerId}")
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
            child: Container(
              decoration: BoxDecoration(
                color: Color(0x2931EE21), // Same background color as previous textfield
                // Uncomment and adjust the border radius if needed
                // borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Type your message...',
                        hintStyle: GoogleFonts.montserrat(
                          color: Color(0xFF267E1E), // Same hint text color as previous textfield
                        ),
                        border: InputBorder.none,
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
          ),

        ],
      ),
    );
  }
}
