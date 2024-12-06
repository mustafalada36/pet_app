import 'package:flutter/material.dart';
import 'package:pet_app/constants.dart';

class favourites extends StatefulWidget {
  @override
  State<favourites> createState() => _favouritesState();
}

class _favouritesState extends State<favourites> {
  bool toggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favourites & Saved Searches",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 20, color: primaryColor),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: primaryColor,
            )),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                toggle
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  toggle = !toggle;
                                });
                              },
                              child: const Text(
                                "Favourites",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: primaryColor),
                              ),
                            ),
                          ),
                          Container(
                            color: const Color(0xFF267E1E),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 3,
                            ),
                          )
                        ],
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  toggle = !toggle;
                                });
                              },
                              child: Text(
                                "Favourites",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: primaryColor.withOpacity(0.5)),
                              ),
                            ),
                          ),
                          Container(
                            color: primaryColor.withOpacity(0.5),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 3,
                            ),
                          )
                        ],
                      ),
                toggle
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  toggle = !toggle;
                                });
                              },
                              child: Text(
                                "Saved Searches",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: primaryColor.withOpacity(0.5)),
                              ),
                            ),
                          ),
                          Container(
                            color: primaryColor.withOpacity(0.5),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 3,
                            ),
                          )
                        ],
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  toggle = !toggle;
                                });
                              },
                              child: const Text(
                                "Saved Searches",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: primaryColor),
                              ),
                            ),
                          ),
                          Container(
                            color: primaryColor,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 3,
                            ),
                          )
                        ],
                      ),
              ],
            ),
            const SizedBox(height: 20),
            adsCard()
          ],
        ),
      ),
    );
  }
}

class adsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 170,
        width: double.infinity,
        child: Card(
          color: secondaryColor,
          elevation: 0,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Image.asset("assets/images/rabbitss.png"),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25),
                  Text(
                    "Bella",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, top: 5),
                    child: Text(
                      "Rabbit Breed",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, top: 5),
                    child: Text(
                      "Johar Town",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, top: 5),
                    child: Text(
                      "PKR 20,000",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
