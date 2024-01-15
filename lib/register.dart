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
  TextEditingController _imeNumberController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  Future<void> registerUser(BuildContext context) async {
    String imeNumber = _imeNumberController.text;
    String name = _nameController.text;

    // Validate input fields
    if (imeNumber.isEmpty || name.isEmpty) {
      print('All fields are required');
      return;
    }

    // URL of the API you want to call (replace with your actual API URL)
    String apiUrl = 'http://localhost:8080//cit2023/setting.php';

    // Create the body of the request to send data
    Map<String, dynamic> requestBody = {
      'imeNumber': imeNumber,
      'name': name,
    };

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        body: requestBody,
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        print('Registration Successful');

        // Navigate to MenuPage on successful registration
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } else if (response.statusCode == 500) {
        // Handle unsuccessful registration
        print('Registration Error');
        showErrorDialog(context, 'เบอร์โทรศัพท์นี้มีบัญชีอยู่แล้ว');
      }
    } catch (error) {
      // Handle connection error
      print('Connection Error: $error');
      showErrorDialog(context, 'Connection error');
    }
  }

  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog box
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

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

              // Name TextField with image icon
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Device Name',
                  prefixIcon: Image.asset('images/profile.png',
                      height: 20.0, width: 20.0),
                ),
              ),
              SizedBox(height: 16.0),

              // Register Button
              ElevatedButton(
                onPressed: () {
                  String imeNumber = _imeNumberController.text;
                  String name = _nameController.text;

                  if (imeNumber.isEmpty || name.isEmpty) {
                    // Show error borders around empty fields
                    if (imeNumber.isEmpty) {
                      _imeNumberController.clear();
                    }
                    if (name.isEmpty) {
                      _nameController.clear();
                    }

                    print('Registration Error');
                    showErrorDialog(context, 'กรุณากรอกข้อมูลให้ครบ');
                  } else {
                    // Submit the registration data
                    registerUser(context);
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
