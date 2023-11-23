// loca_page.dart

import 'package:flutter/material.dart';

class LocaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/map.png', // Replace with the actual path to your location icon
              width: 500.0, // Set the desired width
              height: 500.0, // Set the desired height
            ),
            SizedBox(height: 16.0),
            Text(
              '',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
