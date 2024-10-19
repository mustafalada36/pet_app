// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/Screens/adDetails.dart';
import 'package:pet_app/Screens/breeds.dart';
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
import 'package:pet_app/Screens/myCart.dart';
import 'package:pet_app/Screens/pets.dart';
import 'package:pet_app/Screens/profileScreen.dart';
import 'package:pet_app/Screens/signup.dart';
import 'package:pet_app/Screens/splashscreen.dart';
// import 'package:pet_app/Screens/testingScreen.dart';

import 'Screens/addNewAddress.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}
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
      home: pets(),

      //shows
      // debugShowCheckedModeBanner: false,
    );
  }
}
