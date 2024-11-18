import 'package:flutter/material.dart';
import 'package:pet_app/Reuseable Components/adsTemplate.dart';
import 'package:pet_app/constants.dart';

class buyScreen extends StatelessWidget {
  const buyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 294,
                    child: Image.asset(
                      'assets/images/Rectangle 103.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Color(0xFFF6FAFF),
                          ),
                        ),
                        Row(
                          children: const [
                            Icon(Icons.favorite, color: Color(0xFFFFFFFF)),
                            SizedBox(width: 10),
                            Icon(Icons.share, color: Color(0xFFFFFFFF)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 244,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height - 244,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'British Shorthair',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Rs/150,000',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Cat breed',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'About British Shorthair',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(height: 13.7),
                      const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'The British Shorthair Peki Female Tetra Coat Blue',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Add more descriptive rows similarly
                      _buildDescriptionRow('Eyes'),
                      _buildDescriptionRow('Peke Bloodline'),
                      _buildDescriptionRow('Piki Female Kitten'),
                      _buildDescriptionRow('Age 8 Months'),
                      _buildDescriptionRow('Very Active Mashallah'),
                      _buildDescriptionRow('Attractive Blue Eyes'),
                      _buildDescriptionRow('Very Playful'),
                      _buildDescriptionRow('Very Cute Face Female'),
                      _buildDescriptionRow('Looking for a new home.'),
                      _buildDescriptionRow(
                          'Girls or Lady New Owner will be Preferred.'),
                      _buildDescriptionRow('Selling due transfer.'),
                      _buildDescriptionRow(
                          'Her Teenage pic is also Attached.'),
                      _buildDescriptionRow('Both friends cats for Sale.'),
                      _buildDescriptionRow(
                          'Who will buy both will be Discounted Inshallah'),
                      _buildDescriptionRow('Avoid Bogus Offers'),
                      _buildDescriptionRow('No Thirds Parties or Dealers'),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(height: 20),
                          _buildInfoRow('Age', '8 months', Icons.pets),
                          const SizedBox(height: 23),
                          _buildInfoRow('Weight', '4.5 kg', Icons.scale),
                          const SizedBox(height: 20),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(height: 20),
                          _buildInfoRow(
                              'Vaccination', 'Yes', Icons.medical_services),
                          const SizedBox(height: 23),
                          _buildInfoRow('Sex', 'Male', Icons.transgender),
                          const SizedBox(height: 20),
                        ],
                      ),
                      const SizedBox(height: 20),
                      _buildCenteredInfoRow(
                          'Info', 'Details here', Icons.info),
                      const SizedBox(height: 20),

                      _buildShadowContainer(),
                      const SizedBox(height: 20),
                      _buildSafetySection(),
                      _buildRelatedAds(),
                      _buildContactActions(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper Methods
  Widget _buildDescriptionRow(String text) {
    return Row(
      children: [
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(String title, String value, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 144,
          height: 56,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  size: 26,
                  color: primaryColor,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: primaryColor,
                    ),
                  ),
                  Text(
                    value,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF101113),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCenteredInfoRow(String title, String value, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 144,
          height: 56,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  size: 26,
                  color: primaryColor,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: primaryColor,
                    ),
                  ),
                  Text(
                    value,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF101113),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildShadowContainer() {
    return Container(
      width: double.infinity,
      height: 109,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 5),
          ),
        ],
      ),
    );
  }

  Widget _buildSafetySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About your safety!',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: primaryColor,
          ),
        ),
        const SizedBox(height: 10),
        _buildSafetyBullet('Avoid sharing personal information.'),
        _buildSafetyBullet('Meet in a public place.'),
        _buildSafetyBullet('Report suspicious activity.'),
        _buildSafetyBullet('Trust your instincts.'),
      ],
    );
  }

  Widget _buildSafetyBullet(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.58),
      child: Row(
        children: [
          Icon(Icons.circle, size: 6, color: primaryColor),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRelatedAds() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 35.11),
        const Text(
          'Related ads',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 9),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: adsTemplate()),
            const SizedBox(width: 9.39),
            Expanded(child: adsTemplate()),
          ],
        ),
      ],
    );
  }

  Widget _buildContactActions() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildContactIcon(Icons.message),
          const SizedBox(width: 44.96),
          _buildContactIcon(Icons.call),
          const SizedBox(width: 44.96),
          _buildContactIcon(Icons.message),
        ],
      ),
    );
  }

  Widget _buildContactIcon(IconData icon) {
    return Container(
      width: 56,
      height: 43,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Icon(
        icon,
        color: primaryColor,
      ),
    );
  }
}
