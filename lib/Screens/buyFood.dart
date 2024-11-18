import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/Reuseable%20Components/primaryButton.dart';
import 'package:pet_app/Reuseable%20Components/secondaryButton.dart';
import 'package:pet_app/constants.dart';

import 'homeScreen.dart';

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
                            .fill, // Ensure the image covers the container
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
                            decoration: const BoxDecoration(
                              color: Color(0xFF267E1E),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Color(0xFFF6FAFF),
                            ),
                          ),
                          // Heart and share icons
                          const Row(
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
                decoration: const BoxDecoration(
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
                        const Row(
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
                              'Cat Food',
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
                        const SizedBox(height: 14),
                        // Padding from top
                        Container(
                          width: double.infinity,
                          color: Colors.grey.shade300,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  "Details:",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600, // Semibold
                                    color: Colors.black, // #000000
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Text(
                                      "Condition:",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight:
                                            FontWeight.w400, // Semibold
                                        color: primaryColor, // #000000
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 70),
                                    child: Text(
                                      "New",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight:
                                            FontWeight.w600, // Semibold
                                        color: primaryColor, // #000000
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600, // Semibold
                            color: Colors.black, // #000000
                          ),
                        ),
                        const Text(
                          'Animal King - Best cat food for all ages',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300, // Regular
                            color: Colors.black, // 50% opacity
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Net Weight: 1KG',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300, // Regular
                            color: Colors.black, // 50% opacity
                          ),
                        ),
                        const Text(
                          'Available at just Rs. 1600/-',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300, // Regular
                            color: Colors.black, // 50% opacity
                          ),
                        ),
                        const Text(
                          'Cash on Delivery - Across Pakistan',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300, // Regular
                            color: Colors.black, // 50% opacity
                          ),
                        ),
                        const Text(
                          'Free Delivery',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300, // Regular
                            color: Colors.black, // 50% opacity
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Made from all Natural Ingredients ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300, // Regular
                            color: Colors.black, // 50% opacity
                          ),
                        ),
                        const Text(
                          'Rich in Protein and Nutrients',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300, // Regular
                            color: Colors.black, // 50% opacity
                          ),
                        ),
                        const Text(
                          'Antioxident Formulation',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300, // Regular
                            color: Colors.black, // 50% opacity
                          ),
                        ),
                        const SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            secondaryButton(170, "Add to Cart"),
                            primaryButton(170, "Buy Now"),
                          ],
                        )
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
