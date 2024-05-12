import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Vector.png',
                    width: 183,
                    height: 170,
                  ),
                  const SizedBox(height: 75),
                  const Text('OTP Verification',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF000000),
                        fontFamily: 'Montserrat',
                      )),
                  const SizedBox(height: 6.0),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 29.0),
                    child: Text(
                      'Thank you for registering with us. Please type the OTP as shared on your mobile XXXXXXX123',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF000000),
                        fontFamily: 'Montserrat',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 32),
                  SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OTPDigitTextField(
                            controller: controllers[0], borderRadius: 20),
                        const SizedBox(width: 14.45),
                        OTPDigitTextField(
                            controller: controllers[1], borderRadius: 20),
                        const SizedBox(width: 14.45),
                        OTPDigitTextField(
                            controller: controllers[2], borderRadius: 20),
                        const SizedBox(width: 14.45),
                        OTPDigitTextField(
                            controller: controllers[3], borderRadius: 20),
                      ],
                    ),
                  ),
                  const SizedBox(height: 33),
                  const Text(
                    'OTP not received?',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF000000),
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Add functionality for create account button
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xFF267E1E)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500, // medium weight
                              color: Colors.white, // text color
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 25,
            left: -10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: const Color(0xFF267E1E),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}

class OTPDigitTextField extends StatelessWidget {
  final TextEditingController controller;
  final double borderRadius;

  const OTPDigitTextField(
      {super.key, required this.controller, this.borderRadius = 14.45});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          counterText: '', // Remove character count
        ),
        textAlign: TextAlign.center,
        maxLength: 1,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
      ),
    );
  }
}
