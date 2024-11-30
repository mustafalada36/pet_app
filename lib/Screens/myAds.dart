import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/Reuseable%20Components/topContainer.dart';
import 'package:pet_app/Screens/adDetails.dart';
import 'package:pet_app/Screens/chatsScreen.dart';
import 'package:pet_app/Screens/homeScreen.dart';
import 'package:pet_app/Screens/profileScreen.dart';
import 'package:pet_app/constants.dart';

ImageProvider getImageProvider(String imagePath) {
  if (Uri.tryParse(imagePath)?.isAbsolute ?? false) {
    return NetworkImage(imagePath);
  } else {
    return FileImage(File(imagePath));
  }
}

class myAds extends StatefulWidget {
  final List<Map<String, String>>? adsList;

  // Accept the adsList as a required parameter
  const myAds({Key? key, this.adsList}) : super(key: key);

  @override
  State<myAds> createState() => _myAdsState();
}

class _myAdsState extends State<myAds> {
  int _currentIndex = 3;
  late List<Map<String, String>> adsList;

  @override
  void initState() {
    super.initState();
    // Initialize adsList with the data passed to the widget
    adsList = widget.adsList!;
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Navigation logic
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const homeScreen()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ChatsScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => adDetails()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => myAds(adsList: adsList)),
        );
        break;
      case 4:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => profileScreen()),
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          color: const Color(0xFF267E1E),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          "My Ads",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w900,
            color: primaryColor,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              topContainer(
                "Ads",
                120,
                clr: primaryColor,
                textClr: Colors.white,
                image: Image.asset("assets/images/activeSymbol.png"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CircleAvatar(
                  backgroundColor: primaryColor,
                  child: Text(
                    "${adsList.length}", // Number of ads
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: adsList.length,
              itemBuilder: (context, index) {
                final ad = adsList[index];
                return Card(
                  color: secondaryColor,
                  elevation: 0,
                  borderOnForeground: true,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image Section
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Image(
                            image: getImageProvider(
                                ad['imageFile'] ?? ad['image'] ?? ''),
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 20),
                        // Spacing between image and details
                        // Details Section
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Name of the ad
                              Text(
                                ad['name'] ?? 'No Name',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              // Species and location
                              Text(
                                "${ad['species']}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${ad['location']}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 5),
                              // Price
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "PKR ${ad['price']}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        backgroundColor: Colors.white,
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.chat, size: 30, color: Colors.white),
          Icon(Icons.add_circle_outline, size: 40, color: Colors.white),
          Icon(Icons.list_alt, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        onTap: _onItemTapped,
        color: Colors.green,
        buttonBackgroundColor: Colors.green.shade700,
        height: 60,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
      ),
    );
  }
}
