import 'package:flutter/material.dart';

import '../constants.dart';
import 'homeScreen.dart';

class myCart extends StatefulWidget {
  const myCart({super.key});

  @override
  State<myCart> createState() => _myCartState();
}

class _myCartState extends State<myCart> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: primaryColor,
            )),
        title: Text(
          "My Cart",
          style: TextStyle(
              fontWeight: FontWeight.w900, fontSize: 25, color: primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(children: [
                Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child:
                              Image.asset("assets/images/Food Timothy.png"),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Tuna",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: primaryColor),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "  Rs 1,500",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: primaryColor),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 13,
                                  backgroundColor: primaryColor,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Text(
                                      "-",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (quantity > 1) {
                                          quantity--;
                                        }
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "$quantity",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: primaryColor),
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 13,
                                  backgroundColor: primaryColor,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Text(
                                      "+",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        quantity++;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: CircleAvatar(
                    radius: 13,
                    backgroundColor: primaryColor,
                    child: Text(
                      "x",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(height: 180),
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
                  backgroundColor:
                      WidgetStateProperty.all<Color>(const Color(0xFF267E1E)),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500, // medium weight
                    color: Colors.white, // text color
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
