import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  //for storing data in cloud firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //for authentication
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signUpUser(
      {required String email,
      required String password,
      required String name}) async {
    String res = 'Some Error Occured';
    try {
      if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
        //validation if condition
        //for registering user in firebase auth
        UserCredential credential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
        //for adding user in our cloud firestore
        print(credential.user!.uid);
        await _firestore.collection('Users').doc(credential.user!.uid).set({
          'name': name,
          'email': email,
          'uid': credential.user!.uid,
        });
        res = 'Succesfull';
      }
    } catch (e) {
      print("Error: $e");
      return e.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'Some Error Occured';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        //login user with email and password
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "Successful";
      } else {
        print("Please fill all fields");
      }
    } catch (e) {
      return e.toString();
    }
    return res;
  }

  // For Logout

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
