import 'package:flutter/material.dart';
import 'package:pet_app/Screens/buyScreen2.dart';
import 'package:pet_app/Screens/temporary.dart';
import '../constants.dart';

class adsTemplate extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String species;
  final String location;
  final String price;
  final String adId; // Unique document ID for the ad

  adsTemplate({
    required this.imageUrl,
    required this.name,
    required this.species,
    required this.location,
    required this.price,
    required this.adId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => buyScreen2(adId: adId),
          )),
      child: Container(
        width: 180,
        height: 300,
        child: Card(
          color: secondaryColor,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, top: 5),
                        child: Text(
                          species,
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
                              color: Colors.black,
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
