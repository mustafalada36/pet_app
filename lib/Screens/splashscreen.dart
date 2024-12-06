import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pet_app/Screens/loginscreen.dart';
import 'package:pet_app/Screens/signup.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulate a delay before navigating to the home screen
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => loginScreen()),
      );
    });

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo Image at the top
              Expanded(
                child: Container(
                  child: Image.asset(
                    'assets/images/LogoContainer.png',
                    width: 300,
                    height: 250,
                  ),
                ),
              ),
              // Stack for CircularAvatars and Centered Image using Column and Row
              Expanded(
                child: Stack(
                  children: [
                    // First CircularAvatar (Largest)
                    Center(
                      child: CircleAvatar(
                        radius: 400,
                        child: Container(
                          decoration: BoxDecoration(
                            //  color: const Color(0xFF31EE21).withOpacity(0.25),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color:
                                    const Color(0xFF31EE21).withOpacity(0.25),
                                blurRadius: 50, // Adjust the blur effect
                                spreadRadius: 25, // Adjust the spread effect
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Center(
                      child: CircleAvatar(
                        radius: 170,
                        backgroundColor:
                            const Color(0xFF31EE21).withOpacity(0.35),
                      ),
                    ),

                    Center(
                      child: CircleAvatar(
                        radius: 140,
                        backgroundColor:
                            const Color(0xFF31EE21).withOpacity(0.55),
                      ),
                    ),

                    Container(
                      child: Center(
                        child: Image.asset(
                          'assets/images/pngtree-isolated-cat-on-white-background-png-image_70949271.png',
                          width: 350,
                          height: 400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
