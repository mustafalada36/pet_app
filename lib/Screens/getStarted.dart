import 'package:flutter/material.dart';
import 'package:pet_app/Screens/homeScreen.dart';

class getStarted extends StatelessWidget {
  const getStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(

            margin: EdgeInsets.fromLTRB(40, 10, 0, 0),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset(
                    'assets/images/unsplash_Tn8DLxwuDMA.png',
                    width: 130,
                    height: 130,
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 50,
                  child: Image.asset(
                    'assets/images/unsplash_2l0CWTpcChI.png',
                    width: 200,
                    height: 250,
                  ),
                ),
                Positioned(
                  top: 240,
                  left: 180,
                  child: Image.asset(
                    'assets/images/unsplash_adK3Vu70DEQ.png',
                    width: 150,
                    height: 150,
                  ),
                ),
                
                Positioned(
                  top: 500,
                    left: 10,
                    child: Text('The World Most Advanced\n            Pet Community',style:
                    TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.green.shade800),)),
                
                Positioned(
                  top: 630,
                  child: SizedBox(
                    width: 320,
                    child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const homeScreen()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          const Color(0xFF267E1E)),
                      shape:
                      WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500, // medium weight
                        color: Colors.white, // text color
                      ),
                    ),
                                    ),
                  ),)
              ],
            )
        ),
        

      ),
    );
  }
}
