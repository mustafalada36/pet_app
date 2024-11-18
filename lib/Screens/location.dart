import 'package:flutter/material.dart';
import 'package:pet_app/constants.dart';

class location extends StatefulWidget {
  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  TextEditingController searchController = new TextEditingController();
  List<String> recentSearches = []; // To store the recent search queries

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: primaryColor,
            )),
        title: const Text(
          "Location",
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 25, color: primaryColor),
        ),
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          // Search Container --------------------------------------------
          width: double.infinity,
          height: 80,
          decoration: const BoxDecoration(
            color: secondaryColor,
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // White background for search container
                    borderRadius: BorderRadius.circular(24), // Rounded edges
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: primaryColor),
                      // Search Icon
                      const SizedBox(width: 10),
                      // Space between icon and text
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: const InputDecoration(
                            hintText: 'Search ', //$city
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: GestureDetector(
                  onTap: () {
                    searchController.clear();
                    setState(() {});
                  },
                  child: Text(
                    'Clear',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.blue.shade200,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          width: double.infinity,
          height: 50,
          color: Colors.white,
          child: Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.location_searching,
                    color: Colors.grey,
                  )),
              const Text(
                "Use Current Location",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 50,
            color: secondaryColor,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Recent",
                style: TextStyle(
                    fontSize: 20,
                    color: primaryColor,
                    fontWeight: FontWeight.w500),
              ),
            )),
        // Recent Searches Section
        recentSearches.isNotEmpty
            ? Column(
                children: recentSearches.map((search) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        search,
                        style: const TextStyle(
                            fontSize: 20,
                            color: primaryColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  );
                }).toList(),
              )
            : const SizedBox.shrink(),
        // Hide when there are no recent searches
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 50,
            color: secondaryColor,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Choose Region",
                style: TextStyle(
                    fontSize: 20,
                    color: primaryColor,
                    fontWeight: FontWeight.w500),
              ),
            )),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            color: Colors.white,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Text(
                  "Punjab, Pakistan",
                  style: TextStyle(
                      fontSize: 20,
                      color: primaryColor,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 5),
                Text(
                  "Sindh, Pakistan",
                  style: TextStyle(
                      fontSize: 20,
                      color: primaryColor,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 5),
                Text(
                  "Balochistan, Pakistan",
                  style: TextStyle(
                      fontSize: 20,
                      color: primaryColor,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 5),
                Text(
                  "Khyber Pakhtunkhwa, Pakistan",
                  style: TextStyle(
                      fontSize: 20,
                      color: primaryColor,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 5),
                Text(
                  "Balochistan, Pakistan",
                  style: TextStyle(
                      fontSize: 20,
                      color: primaryColor,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 5),
                const Text(
                  "Islamabad, Pakistan",
                  style: TextStyle(
                      fontSize: 20,
                      color: primaryColor,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )),
      ]),
    );
  }
}
