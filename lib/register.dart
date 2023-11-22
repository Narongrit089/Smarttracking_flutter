import 'package:flutter/material.dart';
import 'package:smarttracking/flashScreen.dart';
import 'package:smarttracking/menu.dart';
import 'package:http/http.dart' as http;
import 'dart:js';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _imeNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController1 = TextEditingController();
  TextEditingController _passwordController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image(
                image: AssetImage('images/smartim.png'),
                width: 250.0,
                height: 250.0,
              ),

              // Name TextField with image icon
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Image.asset('images/profile.png',
                      height: 20.0, width: 20.0),
                ),
              ),
              SizedBox(height: 16.0),

              // Surname TextField with image icon
              TextField(
                controller: _surnameController,
                decoration: InputDecoration(
                  labelText: 'Surname',
                  prefixIcon: Image.asset('images/profile.png',
                      height: 20.0, width: 20.0),
                ),
              ),
              SizedBox(height: 16.0),

              // IME Number TextField with image icon
              TextField(
                controller: _imeNumberController,
                decoration: InputDecoration(
                  labelText: 'IME Number',
                  prefixIcon: Image.asset('images/telephone.png',
                      height: 20.0, width: 20.0),
                ),
              ),
              SizedBox(height: 16.0),

              // Email TextField with image icon
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Image.asset('images/email.png',
                      height: 20.0, width: 20.0),
                ),
              ),
              SizedBox(height: 16.0),

              // Password TextField with image icon
              TextField(
                controller: _passwordController1,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password 1',
                  prefixIcon: Image.asset('images/password.png',
                      height: 20.0, width: 20.0),
                ),
              ),
              SizedBox(height: 16.0),

              // Confirm Password TextField with image icon
              TextField(
                controller: _passwordController2,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: Image.asset('images/password.png',
                      height: 20.0, width: 20.0),
                ),
              ),
              SizedBox(height: 32.0),

              // Register Button
              ElevatedButton(
                onPressed: () {
                  // Add your registration logic here
                  String name = _nameController.text;
                  String surname = _surnameController.text;
                  String imeNumber = _imeNumberController.text;
                  String email = _emailController.text;
                  String password1 = _passwordController1.text;
                  String password2 = _passwordController2.text;

                  // Validate input fields and perform registration
                  if (name.isNotEmpty &&
                      surname.isNotEmpty &&
                      imeNumber.isNotEmpty &&
                      email.isNotEmpty &&
                      password1.isNotEmpty &&
                      password2.isNotEmpty) {
                    // Perform registration action
                    // You can navigate to the menu page or show a success message here
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MenuPage()),
                    );
                  } else {
                    // Show an error message if any field is empty
                    print('All fields are required');
                  }
                },
                child: Text('Register'),
              ),

              // Cancel Button
              TextButton(
                onPressed: () {
                  // Navigate back to the login page
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: Center(
        child: Text('Welcome to the Menu Page!'),
      ),
    );
  }
}
