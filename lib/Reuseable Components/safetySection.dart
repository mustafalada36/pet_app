import 'package:flutter/material.dart';

import '../constants.dart';

class SafetySection extends StatelessWidget {
  const SafetySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        buildSafetyBullet('Avoid sharing personal information.'),
        buildSafetyBullet('Meet in a public place.'),
        buildSafetyBullet('Report suspicious activity.'),
        buildSafetyBullet('Trust your instincts.'),
      ],
    );
  }

  Widget buildSafetyBullet(String text) {
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
}
