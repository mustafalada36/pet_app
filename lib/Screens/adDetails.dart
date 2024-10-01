import 'package:flutter/material.dart';

class adDetails extends StatelessWidget {
  const adDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x2931EE21),
        leading: IconButton(
          color: Color(0xFF267E1E),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Include Some Details",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 25,
              color: Color(0xFF267E1E)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //=====================================main col

            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                color: Color(0x2931EE21),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "UPLOAD UPTO 5 IMAGES",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Color(0xFF267E1E)),
                    ),
                    SizedBox(width: 15),
                    IconButton(
                      color: Color(0xFF267E1E),
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),

            GestureDetector(
              child: CircleAvatar(
                backgroundColor: Color(0x2931EE21),
                radius: 70,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Image.asset("assets/images/camera.png"),
                    SizedBox(height: 15),
                    Text(
                      'Add Images',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    )
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.centerLeft,
              child: Text(
                "Categories *",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.black),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CircleAvatar(
                    backgroundColor: Color(0x2931EE21),
                    radius: 30,
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Image.asset(
                          "assets/images/loginimg.png",
                          height: 25,
                          width: 25,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ], //=================================================main col
        ),
      ),
    );
  }
}
