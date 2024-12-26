import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_app/Reuseable%20Components/customTextField.dart';
import 'package:pet_app/Screens/loginscreen.dart';
import 'package:pet_app/Screens/otpscreen.dart';

import '../Firebase_services/authetication.dart';
import '../Firebase_services/snack_bar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _acceptTerms = false;
  bool _obscureText = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool isLoading = false;
  String phone = "";

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
    nameController.dispose();
  }

  void signUpUser() async {
    String res = await AuthServices().signUpUser(
        phone: phone,
        email: emailController.text,
        password: passController.text,
        name: nameController.text);
    //if sign up successful go ahead a=otherwise show error
    if (res == 'Succesfull') {
      setState(() {
        isLoading = true;
      });
      //next screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => loginScreen()),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 360.0,
                height: 214.0,
                child: Lottie.asset('assets/animation/anim5.json',
                    width: 360.0, height: 215.0),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0xFF31EE21), width: 1.5),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                padding: const EdgeInsets.all(8.0),
                child: const Icon(Icons.person,
                    size: 40.0, color: Color(0xFF267E1E)),
              ),
              const SizedBox(height: 24),
              const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF39434F),
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Welcome! Please enter your information below and get started.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF808B9A),
                ),
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(22)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(22)),
                  labelStyle: TextStyle(
                    color: Color(0xFF808B9A),
                  ),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(22)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(22)),
                  labelStyle: const TextStyle(
                    color: Color(0xFF808B9A),
                  ),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: passController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Password',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(22)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(22)),
                  labelStyle: const TextStyle(
                    color: Color(0xFF808B9A),
                  ),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: const Color(0xFFA0AEC0),
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Checkbox(
                    value: _acceptTerms,
                    onChanged: (value) {
                      setState(() {
                        _acceptTerms = value!;
                      });
                    },
                    splashRadius: 20,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: BorderSide(
                        color: _acceptTerms
                            ? Colors.transparent
                            : const Color(
                                0xFFC6CED9), // Border color when not selected
                      ),
                    ),
                  ),
                  const Text(
                    'Accept Terms and Conditions',
                    style: TextStyle(
                      color: Color(0xFF808B9A),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24.0),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: signUpUser,
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(
                            const Color(0xFF267E1E)),
                        shape:
                            WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Create Account',
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
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45,
                      fontFamily: 'Noto Sans',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => loginScreen()),
                      );
                    },
                    child: const Text(
                      'Log in here!',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF267E1E),
                        fontFamily: 'Noto Sans',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
