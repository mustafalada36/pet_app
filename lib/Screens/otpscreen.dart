import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Vector.png',
                width: 183,
                height: 170,
              ),
              SizedBox(height: 20),
              Text(
                'Thank you for registering with us.\nPlease type the OTP as shared on your mobile XXXXXXX123',
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OTPDigitTextField(
                      controller: controllers[0], borderRadius: 20),
                  SizedBox(width: 10),
                  OTPDigitTextField(
                      controller: controllers[1], borderRadius: 20),
                  SizedBox(width: 10),
                  OTPDigitTextField(
                      controller: controllers[2], borderRadius: 20),
                  SizedBox(width: 10),
                  OTPDigitTextField(
                      controller: controllers[3], borderRadius: 20),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'OTP not received?',
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement your submit logic here
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
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
      {Key? key, required this.controller, this.borderRadius = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 8),
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
