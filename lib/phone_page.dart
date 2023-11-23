// phone_page.dart

import 'package:flutter/material.dart';

class PhonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/telephone.png', // Replace with the actual path to your phone icon
              width: 200.0, // Set the desired width
              height: 200.0, // Set the desired height
            ),
            SizedBox(height: 16.0),
            Text(
              'Phone Now',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
