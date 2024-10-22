import 'package:flutter/material.dart';

class buyFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Image at the top
            Column(
              children: [
                Stack(
                  children: [
                    // Top image
                    Container(
                      width: double.infinity, // Fit to screen width
                      height: 294,
                      child: Image.asset(
                        'assets/images/buyfood.png',
                        fit: BoxFit
                            .cover, // Ensure the image covers the container
                      ),
                    ),
                    // Row with back arrow, heart, and share icon
                    Positioned(
                      top: 16,
                      left: 16,
                      right: 16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Back arrow inside a circular container
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFF267E1E),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.arrow_back,
                              color: Color(0xFFF6FAFF),
                            ),
                          ),
                          // Heart and share icons
                          Row(
                            children: [
                              Icon(
                                Icons.favorite,
                                color: Color(0xFFFFFFFF),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.share,
                                color: Color(0xFFFFFFFF),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Scrollable content container at the bottom
            Positioned(
              top: 244,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                height: MediaQuery.of(context).size.height - 244,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    // Padding from left and right
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // First Row: "British Shorthair" and "Rs/150,000"
                        SizedBox(height: 20),
                        // Adding some space from the top
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Cat Food Animal King',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                                fontWeight: FontWeight.w600, // Semibold
                                color: Colors.black, // #000000
                              ),
                            ),
                            Text(
                              'Rs/150,000',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                                fontWeight: FontWeight.w600, // Semibold
                                color: Color(0xFF267E1E), // #267E1E
                              ),
                            ),
                          ],
                        ),
                        // Second Row: "Cat breed" text with no space above it
                        Row(
                          children: [
                            Text(
                              'Cat breed',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14,
                                fontWeight: FontWeight.w400, // Regular
                                color: Colors.black
                                    .withOpacity(0.5), // 50% opacity
                              ),
                            ),
                          ],
                        ),
                        // "About British Shorthair" text
                        SizedBox(height: 14),
                        // Padding from top
                        Text(
                          'About British Shorthair',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            fontWeight: FontWeight.w600, // Semibold
                            color: Color(0xFF267E1E), // #267E1E
                          ),
                        ),
                        // First descriptive text with padding from the "About British Shorthair"
                        SizedBox(height: 13.7),
                        // Padding only from "About British Shorthair"
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'The British Shorthair Peki Female Tetra Coat Blue',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400, // Regular
                                  color: Colors.black, // #000000
                                ),
                              ),
                            ),
                          ],
                        ),
                        // The following descriptive texts without extra spacing
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Eyes',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400, // Regular
                                  color: Colors.black, // #000000
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Peke Bloodline',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400, // Regular
                                  color: Colors.black, // #000000
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Piki Female Kitten',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400, // Regular
                                  color: Colors.black, // #000000
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Age 8 Months',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400, // Regular
                                  color: Colors.black, // #000000
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Very Active Mashallah',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400, // Regular
                                  color: Colors.black, // #000000
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                ' Attractive Blue Eyes',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400, // Regular
                                  color: Colors.black, // #000000
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Add more rows as needed for remaining texts
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
