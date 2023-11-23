// userinfo_page.dart

import 'package:flutter/material.dart';

class UserIfPage extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Userinfo Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16.0),
            Text(
              'information',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _surnameController,
              decoration: InputDecoration(labelText: 'Surname'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _mobileController,
              decoration: InputDecoration(labelText: 'Mobile'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle save button click
                String name = _nameController.text;
                String surname = _surnameController.text;
                String email = _emailController.text;
                String mobile = _mobileController.text;
                String password = _passwordController.text;

                // Perform actions with the input data as needed
                // For now, just print the values
                print('Name: $name');
                print('Surname: $surname');
                print('Email: $email');
                print('Mobile: $mobile');
                print('Password: $password');
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
