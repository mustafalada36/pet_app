import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/Screens/forgotPassword.dart';
import 'package:pet_app/Screens/getStarted.dart';
import 'package:pet_app/Screens/otpscreen.dart';
import 'package:pet_app/Screens/signup.dart';
import '../Firebase_services/authetication.dart';
import '../Firebase_services/snack_bar.dart';
import '../constants.dart'; // Import the google_fonts package

class loginScreen extends StatefulWidget {
  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  bool _obscureText = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

  void loginUsers() async {
    String res = await AuthServices().loginUser(
      email: emailController.text,
      password: passController.text,
    );
    //if login  successful go ahead a=otherwise show error
    if (res == 'Successful') {
      setState(() {
        isLoading = true;
      });
      //next screen
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => getStarted()));
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 40),
                Center(
                  child: Image.asset('assets/images/loginimg.png',
                      width: 360.0, height: 214.0),
                ),
                const SizedBox(height: 80),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
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
                const SizedBox(height: 20),
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
                        _obscureText
                            ? Icons.visibility
                            : Icons.visibility_off,
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
                const SizedBox(height: 20),
                const forgotPassword(),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: loginUsers,
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
                          'Login',
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
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      padding: WidgetStateProperty.all<EdgeInsets>(
                        EdgeInsets.zero, // Remove padding for alignment
                      ),
                      minimumSize: WidgetStateProperty.all(
                          const Size(0, 0)), // Min size for alignment
                    ),
                    child: InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          )),
                      child: Text(
                        "Don't have an account? Sign Up",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: Image.asset(
                          'assets/images/google-logo-9822.png',
                          width: 17,
                          height: 17,
                        ),
                        label: const Text(
                          'Continue with Google',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400, // regular weight
                            color: Color(0xFF999999), // text color
                          ),
                        ),
                        onPressed: () {
                          // Continue with Google action
                        },
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: Image.asset(
                          'assets/images/logo-facebookpng-32202.png',
                          width: 17,
                          height: 17,
                        ),
                        label: const Text(
                          'Continue with Facebook',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400, // regular weight
                            color: Colors.white, // text color
                          ),
                        ),
                        onPressed: () {
                          // Continue with Facebook action
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                              const Color(0xFF3B5998)),
                          padding: WidgetStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
