import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart'; // Import the flutter_icons_null_safety package

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Center(
                child: Image.asset('assets/images/Group1386.png'),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Forgot password action
                  },
                  child: Text('Forgot password?'),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Login action
                },
                child: Text('Login'),
              ),
              SizedBox(height: 20),
              Text("You don’t have an account?"),
              SizedBox(height: 20),
              ElevatedButton.icon(
                icon: Icon(FontAwesome.google, size: 24),
                label: Text('Continue with Google'),
                onPressed: () {
                  // Continue with Google action
                },
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(
                icon: Icon(FontAwesome.facebook, size: 24),
                label: Text('Continue with Facebook'),
                onPressed: () {
                  // Continue with Facebook action
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
