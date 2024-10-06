import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';
// import '../../../models/chat_message.dart';
import '../models/chat_message.dart';
import 'chat_input_field.dart';
import 'message.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              // First message: Image from the right-side person
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 162,
                  height: 217,
                  margin: EdgeInsets.only(bottom: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage("assets/images/Pet_info.png"), // Replace with actual image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // Second message: Text from the right-side person with updated text color and 16% opacity for the background
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.only(bottom: 16.0),
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Color(0x2931EE21), // 16% opacity of #31EE21
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'Hello, can I get more info on this?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF000000), // Updated text color to #000000 (black)
                    ),
                  ),
                ),
              ),

              // Third message: Text from the left-side person with updated color and styling
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(bottom: 16.0),
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFF0F5F6), // Updated to #F0F5F6
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rabbit Bunnies',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF000000), // #000000 color
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Male and Female',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF000000),
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Very Active',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF000000),
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Good for Playing and Pets',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // Bottom section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              // Centered Date "Nov 3, 2023"
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Nov 3, 2023',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF000000), // #000000 color
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Centered Row with phone icon and text
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the row
                children: [
                  Icon(
                    Icons.phone,
                    color: Color(0xFF101113), // #101113 color
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Phone number viewed at 23:18',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF101113), // #101113 color
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // TextField for typing a message with updated background color to 16% opacity
              Container(
                decoration: BoxDecoration(
                  color: Color(0x2931EE21), // #31EE21 with 16% opacity
                  // borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Type a message',
                    hintStyle: GoogleFonts.montserrat(
                      color: Color(0xFF267E1E), // #267E1E color for the hint text
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );



    //   Column(
    //   children: [
    //     Expanded(
    //       child: Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
    //         child: ListView.builder(
    //           itemCount: demeChatMessages.length,
    //           itemBuilder: (context, index) =>
    //               Message(message: demeChatMessages[index]),
    //         ),
    //       ),
    //     ),
    //     const ChatInputField(),
    //   ],
    // );
  }
}
