import 'package:flutter/material.dart';

class CustomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                      'assets/images/Rectangle 103.png',
                      fit: BoxFit.cover, // Ensure the image covers the container
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
                  padding: const EdgeInsets.symmetric(horizontal: 20.0), // Padding from left and right
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // First Row: "British Shorthair" and "Rs/150,000"
                      SizedBox(height: 20), // Adding some space from the top
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'British Shorthair',
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
                              color: Colors.black.withOpacity(0.5), // 50% opacity
                            ),
                          ),
                        ],
                      ),
                      // "About British Shorthair" text
                      SizedBox(height: 14), // Padding from top
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
                      SizedBox(height: 13.7), // Padding only from "About British Shorthair"
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
                      // Other descriptive texts (same as before)
                      // ...
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
                              'Attractive Blue Eyes',
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
                              'Very Playful',
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
                              'Very Cute Face Female',
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
                              'Looking for a new home.',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12,
                                fontWeight: FontWeight.w400, // Regular
                                color: Colors.black, // #000000
                              ),
                            ),
                          ),
                        ],
                      ),Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Girls or Lady New Owner will be Preferred. ',
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
                              'Selling due transfer. ',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12,
                                fontWeight: FontWeight.w400, // Regular
                                color: Colors.black, // #000000
                              ),
                            ),
                          ),
                        ],
                      ),Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Her Teenage pic is also Attached.',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12,
                                fontWeight: FontWeight.w400, // Regular
                                color: Colors.black, // #000000
                              ),
                            ),
                          ),
                        ],
                      ),Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Both friends cats for Sale. ',
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
                              'Who will buy both will be Discounted Inshallah',
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
                              '',
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
                              'Avoid Bogus Offers',
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
                              'No Thirds Parties or Dealers',
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

                      // Row with two columns for Age and Weight
                      SizedBox(height: 20), // Add some space
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // First container (Age)
                          Container(
                            width: 144,
                            height: 56,
                            decoration: BoxDecoration(
                              color: Color(0xFF31EE21).withOpacity(0.16), // 16% opacity green
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                // Icon column
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.pets,
                                    size: 26,
                                    color: Color(0xFF267E1E), // Dark green icon
                                  ),
                                ),
                                // Text columns
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Age',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500, // Medium
                                        color: Color(0xFF267E1E), // Dark green
                                      ),
                                    ),
                                    Text(
                                      '8 months',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500, // Medium
                                        color: Color(0xFF101113), // Darker grey
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Second container (for other info like weight if needed)
                          Container(
                            width: 144,
                            height: 56,
                            decoration: BoxDecoration(
                              color: Color(0xFF31EE21).withOpacity(0.16), // 16% opacity green
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                // Icon column
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.scale, // Another example icon
                                    size: 26,
                                    color: Color(0xFF267E1E), // Dark green icon
                                  ),
                                ),
                                // Text columns
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Weight',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500, // Medium
                                        color: Color(0xFF267E1E), // Dark green
                                      ),
                                    ),
                                    Text(
                                      '4.5 kg',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500, // Medium
                                        color: Color(0xFF101113), // Darker grey
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 23), // Add some space
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // First container (Age)
                          Container(
                            width: 144,
                            height: 56,
                            decoration: BoxDecoration(
                              color: Color(0xFF31EE21).withOpacity(0.16), // 16% opacity green
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                // Icon column
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.pets,
                                    size: 26,
                                    color: Color(0xFF267E1E), // Dark green icon
                                  ),
                                ),
                                // Text columns
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Age',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500, // Medium
                                        color: Color(0xFF267E1E), // Dark green
                                      ),
                                    ),
                                    Text(
                                      '8 months',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500, // Medium
                                        color: Color(0xFF101113), // Darker grey
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Second container (for other info like weight if needed)
                          Container(
                            width: 144,
                            height: 56,
                            decoration: BoxDecoration(
                              color: Color(0xFF31EE21).withOpacity(0.16), // 16% opacity green
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                // Icon column
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.scale, // Another example icon
                                    size: 26,
                                    color: Color(0xFF267E1E), // Dark green icon
                                  ),
                                ),
                                // Text columns
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Weight',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500, // Medium
                                        color: Color(0xFF267E1E), // Dark green
                                      ),
                                    ),
                                    Text(
                                      '4.5 kg',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500, // Medium
                                        color: Color(0xFF101113), // Darker grey
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Row with one centered container below the previous two containers
                      SizedBox(height: 20), // Add some space
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Center this container
                        children: [
                          Container(
                            width: 144,
                            height: 56,
                            decoration: BoxDecoration(
                              color: Color(0xFF31EE21).withOpacity(0.16), // 16% opacity green
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                // Icon column
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.info, // Example icon
                                    size: 26,
                                    color: Color(0xFF267E1E), // Dark green icon
                                  ),
                                ),
                                // Text columns
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Info',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500, // Medium
                                        color: Color(0xFF267E1E), // Dark green
                                      ),
                                    ),
                                    Text(
                                      'Details here',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500, // Medium
                                        color: Color(0xFF101113), // Darker grey
                                      ),
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
