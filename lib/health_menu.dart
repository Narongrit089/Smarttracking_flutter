// menu_h_page.dart

import 'package:flutter/material.dart';
import 'sos_page.dart';
import 'phone_page.dart';
import 'tracking.dart';
import 'regis_health.dart';
import 'userinfo.dart';
import 'sett_page.dart';
import 'package:smarttracking/regis_health.dart';
import 'package:smarttracking/showList.dart';

class MenuHPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MenuHealth Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          padding: EdgeInsets.all(16.0),
          children: [
            buildMenuItem(context, 'Heart', 'images/heart.png', () {
              // Handle menu item 1 click
            }),
            buildMenuItem(context, 'Temperature', 'images/temperature.png', () {
              // Handle menu item 2 click
            }),
            buildMenuItem(context, 'Heart rate', 'images/heart-attack.png', () {
              // Handle menu item 3 click
            }),
            buildMenuItem(context, 'Sleep', 'images/sleeping.png', () {
              // Handle menu item 4 click
            }),
            buildMenuItem(context, 'Health Data', 'images/core.png', () {
              // Handle menu item 5 click
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HealthDataPage()),
              );
            }),
            buildMenuItem(context, 'Data Health', 'images/profile.png', () {
              // Handle your new menu item click
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => RegisterPage()),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(BuildContext context, String title, String imagePath,
      VoidCallback onPressed) {
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
