import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/Group1386.png',
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Add your forgot password logic here
                },
                child: const Text('Forgot password?'),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your login logic here
              },
              child: Text('Login'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
            const SizedBox(height: 20),
            const Text("You don’t have an account?"),
            TextButton(
              onPressed: () {
                // Add your signup logic here
              },
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(FontAwesome5.google, size: 24),
              label: const Text('Continue with Google'),
              onPressed: () {
                // Continue with Google action
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              icon: const Icon(FontAwesome5.facebook, size: 24),
              label: const Text('Continue with Facebook'),
              onPressed: () {
                // Continue with Facebook action
              },
            ),
          ],
        ),
      ),
    );
  }
}
