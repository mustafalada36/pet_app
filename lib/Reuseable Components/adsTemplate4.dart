import 'package:flutter/material.dart';
import 'package:pet_app/Screens/buyFood.dart';
import 'package:pet_app/Screens/buyMaintainanceService.dart';
import 'package:pet_app/Screens/buyMedicalService.dart';
import 'package:pet_app/Screens/buyScreen2.dart';
import 'package:pet_app/Screens/temporary.dart';
import '../constants.dart';

class adsTemplate4 extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String doctor;
  final String location;
  final String? price;
  final String adId;

  // Unique document ID for the ad
  final String workHours;

  adsTemplate4({
    required this.imageUrl,
    required this.name,
    // required this.species,
    required this.location,
    this.price,
    required this.adId,
    required this.workHours,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => buyMedical(adId: adId),
          )),
      child: Container(
        width: 180,
        constraints: BoxConstraints(maxHeight: 250),
        // height: double.infinity,
        child: Card(
          color: secondaryColor,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageUrl,
                        width: 150,
                        height: 150, // Scales dynamically
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    // Added a Column to be the Flex parent of Expanded
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            color: primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, top: 5),
                        child: Text(
                          doctor,
                          style: const TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, top: 5),
                        child: Text(
                          workHours,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, top: 5),
                        child: Text(
                          location,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, top: 5),
                        child: Text(
                          "PKR $price",
                          style: const TextStyle(
                              color: primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
