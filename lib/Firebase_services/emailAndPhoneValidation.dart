import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/Firebase_services/snack_bar.dart';

import '../Screens/adDetails.dart';
import '../Screens/editProfile.dart';

class emailAndPhone {
  static Future<bool> checkUserProfile(BuildContext context) async {
    final String? userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      return false; // No user logged in
    }

    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .get();

      if (userDoc.exists) {
        // Check if both email and phone are present
        String? email = userDoc['email'];
        String? phone = userDoc['phone'];

        if (email != null &&
            phone != null &&
            email.isNotEmpty &&
            phone.isNotEmpty) {
          return true; // Email and phone are valid
        } else {
          // Show snackbar for missing information and redirect to EditProfile

          mySnack.error('Please update phone and email to post ad.');
          
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditProfile()),
          );
          return false;
        }
      } else {
        // If user document doesn't exist, handle accordingly
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('User data not found. Please update profile.')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditProfile()),
        );
        return false;
      }
    } catch (e) {
      // Handle errors
      debugPrint("Error fetching user data: $e");
      return false;
    }
  }
}
