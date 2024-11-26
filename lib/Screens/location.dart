import 'package:flutter/material.dart';
import 'package:pet_app/constants.dart';

import '../Other Services/current_location.dart';

class Location extends StatefulWidget {
  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  TextEditingController searchController = TextEditingController();

  List<String> cities = [
    'Karachi',
    'Lahore',
    'Islamabad',
    'Rawalpindi',
    'Faisalabad',
    'Multan',
    'Peshawar',
    'Quetta',
    'Sialkot',
    'Gujranwala',
    'Sargodha',
    'Bahawalpur',
    'Hyderabad',
    'Abbottabad',
    'Gilgit',
    'Mardan',
  ];

  List<String> filteredCities = [];

  @override
  void initState() {
    super.initState();
    // Initially, show all cities
    filteredCities = cities;
  }

  void filterCities(String query) {
    final results = cities
        .where((city) => city.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      filteredCities = results;
    });
  }

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
          ),
        ),
        title: const Text(
          "Location",
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 25, color: primaryColor),
        ),
      ),
      body: Column(
        children: [
          // Search Field
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
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
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: primaryColor),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            onChanged: (value) => filterCities(value),
                            decoration: const InputDecoration(
                              hintText: 'Search cities',
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
                      filterCities(''); // Reset the search
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
          // Use Current Location
          GestureDetector(
            onTap: () async {
              final selectedCity = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CurrentLocation()),
              );
              if (selectedCity != null) {
                setState(() {
                  cityName = selectedCity;
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              width: double.infinity,
              height: 50,
              color: Colors.white,
              child: Row(
                children: [
                  const Icon(
                    Icons.location_searching,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    cityName.isNotEmpty
                        ? cityName // Display fetched city name
                        : "Use Current Location", // Default text
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Choose Region
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
            ),
          ),
          // Filtered City List
          Expanded(
            child: filteredCities.isNotEmpty
                ? ListView.builder(
                    itemCount: filteredCities.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          filteredCities[index],
                          style: const TextStyle(
                            fontSize: 18,
                            color: primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: () {
                          // Handle city selection
                          Navigator.pop(context, filteredCities[index]);
                        },
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      'No cities found',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
