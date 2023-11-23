// menu_h_page.dart

import 'package:flutter/material.dart';
import 'sos_page.dart';
import 'phone_page.dart';
import 'tracking.dart';
import 'menu_health.dart';
import 'userinfo.dart';
import 'sett_page.dart';

class MenuHPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MenuHealth Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/nurse.png', // Replace with the actual path to your menu health icon
              width: 150.0, // Set the desired width
              height: 150.0, // Set the desired height
            ),
            SizedBox(height: 16.0),
            SizedBox(height: 16.0),
            Text(
              'MenuHealth',
              style: TextStyle(fontSize: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildMenuItem('Heart', 'images/heart.png', () {
                  // Handle menu item 1 click
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Item1Page()),
                  // );
                }),
                buildMenuItem('Temperature', 'images/temperature.png', () {
                  // Handle menu item 2 click
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Item2Page()),
                  // );
                }),
                buildMenuItem('Heart rate', 'images/heart-attack.png', () {
                  // Handle menu item 3 click
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Item3Page()),
                  // );
                }),
                buildMenuItem('Sleep', 'images/sleeping.png', () {
                  // Handle menu item 4 click
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Item4Page()),
                  // );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(String title, String imagePath, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: 3.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 120.0,
              width: 120.0,
            ),
            SizedBox(height: 8.0),
            Text(title),
          ],
        ),
      ),
    );
  }
}
