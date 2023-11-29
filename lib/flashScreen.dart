import 'package:flutter/material.dart';
import 'package:smarttracking/register.dart';
import 'package:smarttracking/menu.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void submitLogin(BuildContext context) async {
    String email = emailController.text;
    String password = passwordController.text;

    // URL of the API you want to call (checklogin.php)
    String apiUrl = 'http://localhost:8080/cit2023/checklogin.php';

    // Create the body of the request to send data
    Map<String, dynamic> requestBody = {
      'email': email,
      'password': password,
    };

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        body: requestBody,
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        print('Login Successfully');

        // Navigate to MenuPage1 on successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MenuPage1()),
        );
      } else {
        // Handle unsuccessful login
        print('Login Error');
        showErrorDialog(context,
            'Invalid username or password'); // แสดง error ด้วย showDialog
      }
    } catch (error) {
      // Handle connection error
      print('Connection Error: $error');
      showErrorDialog(
          context, 'Connection error'); // แสดง error ด้วย showDialog
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
                Navigator.of(context).pop(); // ปิดกล่องข้อความ
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
        title: Text('Login'),
      ),
      body: Padding(
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
            SizedBox(height: 16.0),

            // Username TextField with icon
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Username',
                prefixIcon: Image.asset(
                  'images/profile.png',
                  height: 20.0,
                  width: 20.0,
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // Password TextField with icon
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Image.asset(
                  'images/password.png',
                  height: 20.0,
                  width: 20.0,
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            SizedBox(height: 32.0),

            // Login Button
            ElevatedButton(
              onPressed: () {
                String username = emailController.text;
                String password = passwordController.text;

                if (username.isEmpty || password.isEmpty) {
                  // Show error borders around empty fields
                  if (username.isEmpty) {
                    emailController.clear();
                    passwordController.text = ''; // Trigger the error border
                  }
                  if (password.isEmpty) {
                    emailController.clear();
                    passwordController.text = ''; // Trigger the error border
                  }

                  print('Username and password are required');
                } else {
                  // Submit the login data
                  submitLogin(context);
                }
              },
              child: Text('Login'),
            ),

            // Register Button
            TextButton(
              onPressed: () {
                // Navigate to the register page
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
