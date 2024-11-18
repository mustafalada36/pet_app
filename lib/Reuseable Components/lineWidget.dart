import 'package:flutter/material.dart';

class lineWidget extends StatelessWidget {
  const lineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      //=====================================================  line
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        color: const Color(0xFF267E1E),
        child: const SizedBox(
          width: double.infinity,
          height: 1,
        ),
      ),
    );
  }
}
