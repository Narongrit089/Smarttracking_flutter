import 'package:flutter/material.dart';
import 'package:smarttracking/flashScreen.dart';

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
              // Name TextField
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(height: 16.0),

              // Surname TextField
              TextField(
                controller: _surnameController,
                decoration: InputDecoration(labelText: 'Surname'),
              ),
              SizedBox(height: 16.0),

              // IME Number TextField
              TextField(
                controller: _imeNumberController,
                decoration: InputDecoration(labelText: 'IME Number'),
              ),
              SizedBox(height: 16.0),

              // Email TextField
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 16.0),

              // Password TextField
              TextField(
                controller: _passwordController1,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password 1'),
              ),
              SizedBox(height: 16.0),

              // Confirm Password TextField
              TextField(
                controller: _passwordController2,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Confirm Password'),
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
                    // You can navigate to another page or show a success message here
                    // For simplicity, let's print the registration details to the console
                    print(
                        'Registration successful:\nName: $name\nSurname: $surname\nIME Number: $imeNumber\nEmail: $email\nPassword 1: $password1\nPassword 2: $password2');

                    // Navigate back to the login page
                    Navigator.pop(context);
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
                  // เพิ่มคำสั่งไปยังหน้าผู้ใช้
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginPage()));
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
