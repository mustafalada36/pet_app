import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/Reuseable%20Components/adsTemplate.dart';
import 'package:pet_app/Reuseable%20Components/topContainer.dart';
import 'package:pet_app/Screens/adDetails.dart';
import 'package:pet_app/Screens/breeds.dart';
import 'package:pet_app/Screens/buyFood.dart';
import 'package:pet_app/Screens/buyScreen2.dart';
import 'package:pet_app/Screens/cashonDelivery.dart';
import 'package:pet_app/Screens/chatsScreen.dart';
import 'package:pet_app/Screens/creditndebit.dart';
import 'package:pet_app/Screens/editProfile.dart';
import 'package:pet_app/Screens/favourites.dart';
import 'package:pet_app/Screens/jazzcash.dart';
import 'package:pet_app/Screens/location.dart';
import 'package:pet_app/Screens/messageScreen.dart';
import 'package:pet_app/Screens/getStarted.dart';
import 'package:pet_app/Screens/homeScreen.dart';
import 'package:pet_app/Screens/loginscreen.dart';
import 'package:pet_app/Screens/myAds.dart';
import 'package:pet_app/Screens/myCart.dart';
import 'package:pet_app/Screens/profileScreen.dart';
import 'package:pet_app/Screens/seeAllPets.dart';
import 'package:pet_app/Screens/signup.dart';
import 'package:pet_app/Screens/splashscreen.dart';
import 'package:pet_app/models/Chat.dart';
import 'Screens/addNewAddress.dart';
import 'Screens/buyDog.dart';
import 'Screens/buyScreen.dart';
import 'Other Services/current_location.dart';
import 'Screens/temporary.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: FirebaseOptions(
          apiKey: "AIzaSyA-P9wCjLyxtvxpU2xJoNyzJ1WN65PlMMY",
          appId: "1:120140236484:android:1814d5c9775aff24396b91",
          messagingSenderId: "120140236484",
          projectId: "pet-app-b40aa",
          storageBucket: "pet-app-b40aa.firebasestorage.app",
        ),
      );
    }
    runApp(const MyApp());
  } catch (e) {
    print("Firebase initialization error: $e");
  }
}
/*void main() async {
  runApp(const MyApp());
}*/

//main ma kaam kerna

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF267E1E)),
        useMaterial3: true,
      ),
      home: loginScreen(),

      //shows
      // debugShowCheckedModeBanner: false,
    );
  }
}

//save info for login
/*StreamBuilder(
stream: FirebaseAuth.instance.authStateChanges(),
builder: (context, snapshot) {
if (snapshot.hasData) {
return homeScreen();
} else {
return loginScreen();
}
},
)*/
