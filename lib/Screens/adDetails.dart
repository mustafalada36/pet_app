import 'package:flutter/material.dart';
import 'package:pet_app/Reuseable%20Components/customDropDownTextField.dart';
import 'package:pet_app/Reuseable%20Components/customTextField.dart';
import 'package:pet_app/Reuseable%20Components/lineWidget.dart';
import 'package:pet_app/Reuseable%20Components/textHeading.dart';
import 'package:pet_app/Screens/location.dart';
import 'package:pet_app/constants.dart';

import '../Other Services/current_location.dart';
import 'homeScreen.dart';

class adDetails extends StatefulWidget {
  @override
  State<adDetails> createState() => _adDetailsState();
}

class _adDetailsState extends State<adDetails> {
  String selectedBreed = "None";
  String selectedGender = "";
  String selectedVaccine = "";
  String selectedCategory = "Animals";

  // Function to update selected gender
  void _selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  void _selectVaccine(String vaccine) {
    setState(() {
      selectedVaccine = vaccine;
    });
  }

  /*void _selectCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        leading: IconButton(
          color: primaryColor,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          "Include Some Details",
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 25, color: primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              //===========================================main col

              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  color: secondaryColor,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          "UPLOAD UPTO 5 IMAGES",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Color(0xFF267E1E)),
                        ),
                      ),
                      const SizedBox(width: 15),
                      IconButton(
                        color: primaryColor,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),

              GestureDetector(
                child: CircleAvatar(
                  backgroundColor: secondaryColor,
                  radius: 70,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Image.asset("assets/images/camera.png"),
                      const SizedBox(height: 15),
                      const Text(
                        'Add Images',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              textHeading(text: "Categories *"),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CircleAvatar(
                      backgroundColor: primaryColor,
                      radius: 30,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Image.asset(
                            "assets/images/loginimg.png",
                            height: 25,
                            width: 25,
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Show a modal bottom sheet with options
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: const Text("Animals"),
                                  onTap: () {
                                    setState(() {
                                      selectedCategory = "Animals";
                                    });
                                    Navigator.pop(
                                        context); // Close the bottom sheet
                                  },
                                ),
                                ListTile(
                                  title: const Text("Food"),
                                  onTap: () {
                                    setState(() {
                                      selectedCategory = "Food";
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text("Maintainance"),
                                  onTap: () {
                                    setState(() {
                                      selectedCategory = "Maintainance";
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text("Medical"),
                                  onTap: () {
                                    setState(() {
                                      selectedCategory = "Medical";
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            selectedCategory, // Display the selected breed
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: primaryColor,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          weight: 50,
                          color: primaryColor,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              const lineWidget(),
              const SizedBox(height: 15),
              textHeading(text: "Name *"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: customTextField(
                  width: double.infinity,
                  height: 60,
                ),
              ),
              const SizedBox(height: 15),
              const lineWidget(),

              const SizedBox(height: 15),

              textHeading(text: "Price *"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: customTextField(
                  width: double.infinity,
                  height: 60,
                ),
              ),
              const SizedBox(height: 15),
              const lineWidget(),
              const SizedBox(height: 15),
              textHeading(text: "Breed *"),
              GestureDetector(
                onTap: () {
                  // Show a modal bottom sheet with options
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: const Text("Cat"),
                              onTap: () {
                                setState(() {
                                  selectedBreed = "Cat";
                                });
                                Navigator.pop(
                                    context); // Close the bottom sheet
                              },
                            ),
                            ListTile(
                              title: const Text("Dog"),
                              onTap: () {
                                setState(() {
                                  selectedBreed = "Dog";
                                });
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: const Text("Rabbit"),
                              onTap: () {
                                setState(() {
                                  selectedBreed = "Rabbit";
                                });
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        selectedBreed, // Display the selected breed
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const lineWidget(),
              const SizedBox(height: 15),
              textHeading(text: "Sex *"),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => _selectGender("Male"),
                    child: Container(
                      width: 80,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: selectedGender == "Male"
                            ? primaryColor
                            : Colors.white, // Dynamic color
                        border: Border.all(color: primaryColor, width: 2),
                      ),
                      child: Center(
                        child: Text(
                          "Male",
                          style: TextStyle(
                            color: selectedGender == "Male"
                                ? Colors.white
                                : Colors.grey, // Dynamic text color
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _selectGender("Female"),
                    child: Container(
                      width: 80,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: selectedGender == "Female"
                            ? primaryColor
                            : Colors.white, // Dynamic color
                        border: Border.all(color: primaryColor, width: 2),
                      ),
                      child: Center(
                        child: Text(
                          "Female",
                          style: TextStyle(
                            color: selectedGender == "Female"
                                ? Colors.white
                                : Colors.grey, // Dynamic text color
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _selectGender("Cross"),
                    child: Container(
                      width: 80,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: selectedGender == "Cross"
                            ? primaryColor
                            : Colors.white, // Dynamic color
                        border: Border.all(color: primaryColor, width: 2),
                      ),
                      child: Center(
                        child: Text(
                          "Cross",
                          style: TextStyle(
                            color: selectedGender == "Cross"
                                ? Colors.white
                                : Colors.grey, // Dynamic text color
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const lineWidget(),
              const SizedBox(height: 15),
              textHeading(text: "Age *"),
              const SizedBox(height: 10),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: customDropDownButton(
                      width: 120,
                      height: 60,
                      hintText: "Age",
                      dropdownItems: const [
                        "NA",
                        "New Born",
                        "3 months",
                        "6 months",
                        "9 months",
                        "1 year old",
                        "2 year old",
                        "3 year old",
                        "4 year old",
                        "5 year old",
                        "More than 5 years old"
                      ])),
              const SizedBox(height: 10),

              const lineWidget(),
              const SizedBox(height: 15),
              textHeading(text: "Vaccinated *"),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: GestureDetector(
                      onTap: () => _selectVaccine('Yes'),
                      child: Container(
                        width: 80,
                        // Width from the original customTextField
                        height: 50,
                        // Height from the original customTextField
                        decoration: BoxDecoration(
                          color: selectedVaccine == 'Yes'
                              ? primaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: primaryColor, width: 2),
                        ),
                        child: Center(
                          child: Text(
                            "Yes",
                            // Hint text converted to display as regular text
                            style: TextStyle(
                                color: selectedVaccine == 'Yes'
                                    ? Colors.white
                                    : Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: GestureDetector(
                      onTap: () => _selectVaccine('No'),
                      child: Container(
                        width: 80,
                        // Width from the original customTextField
                        height: 50,
                        // Height from the original customTextField
                        decoration: BoxDecoration(
                          color: selectedVaccine == 'No'
                              ? primaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: primaryColor, width: 2),
                        ),
                        child: Center(
                          child: Text(
                            "No",
                            // Hint text converted to display as regular text
                            style: TextStyle(
                                color: selectedVaccine == 'No'
                                    ? Colors.white
                                    : Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),
              const lineWidget(),

              const SizedBox(height: 10),

              //tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt
              textHeading(text: "Location *"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: GestureDetector(
                      onTap: () async {
                        // Navigate to CurrentLocation screen and get the selected city
                        final selectedCity = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CurrentLocation(),
                          ),
                        );
                        // If a city is selected, update the cityName
                        if (selectedCity != null) {
                          setState(() {
                            cityName = selectedCity;
                          });
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                            cityName.isNotEmpty
                                ? cityName // Display fetched city name
                                : "Choose", // Default text
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 100),
                          const Icon(
                            Icons.location_on,
                            color: Colors.redAccent,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: IconButton(
                      onPressed: () async {
                        // Navigate to the Location screen and get the selected city
                        final selectedCity = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Location(),
                          ),
                        );
                        // If a city is selected, update the cityName
                        if (selectedCity != null) {
                          setState(() {
                            cityName =
                                selectedCity; // Update the cityName with selected city
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Color(0xFF267E1E),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              const lineWidget(),
              const SizedBox(height: 15),
              textHeading(
                text: "Ad Title *",
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: customTextField(
                  width: double.infinity,
                  height: 60,
                ),
              ),
              const SizedBox(height: 15),
              const lineWidget(),
              const SizedBox(height: 15),

              textHeading(
                text: "Description *",
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: customTextField(
                  width: double.infinity,
                  height: 60,
                ),
              ),
              const SizedBox(height: 15),
              const lineWidget(),
              const SizedBox(height: 15),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
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
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Post',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500, // medium weight
                      color: Colors.white, // text color
                    ),
                  ),
                ),
              ),
            ], //=================================================main col
          ),
        ),
      ),
    );
  }
}
