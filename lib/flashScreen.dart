import 'package:flutter/material.dart';
import 'package:smarttracking/register.dart';
import 'package:smarttracking/menu.dart';

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
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                prefixIcon: Image.asset('images/profile.png',
                    height: 20.0, width: 20.0),
              ),
            ),
            SizedBox(height: 16.0),

            // Password TextField with icon
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Image.asset('images/password.png',
                    height: 20.0, width: 20.0),
              ),
            ),
            SizedBox(height: 32.0),

            // Login Button
            ElevatedButton(
              onPressed: () {
                String username = _usernameController.text;
                String password = _passwordController.text;

                if (username.isNotEmpty && password.isNotEmpty) {
                  // Navigate to the MenuPage
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MenuPage1()),
                  );
                } else {
                  print('Username and password are required');
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
