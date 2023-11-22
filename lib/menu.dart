import 'package:flutter/material.dart';

class MenuPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image outside the GridViewHaHa
            Container(
              height: 100.0, // Set the desired height
              width: 250.0, // Set the desired width
              child: Image.asset(
                'images/smartim.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.0),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              children: [
                buildMenuItem('SOS', 'images/sos.png', () {
                  // Handle menu item click
                  print('Menu 1 clicked');
                }),
                buildMenuItem('Phone', 'images/pa.png', () {
                  // Handle menu item click
                  print('Menu 2 clicked');
                }),
                buildMenuItem('Location', 'images/loca.png', () {
                  // Handle menu item click
                  print('Menu 3 clicked');
                }),
                buildMenuItem('Nurse', 'images/nurse.png', () {
                  // Handle menu item click
                  print('Menu 4 clicked');
                }),
                buildMenuItem('Setting', 'images/settings.png', () {
                  // Handle menu item click
                  print('Menu 5 clicked');
                }),
                buildMenuItem('More', 'images/softwareS.png', () {
                  // Handle menu item click
                  print('Menu 6 clicked');
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
              height: 120.0, // ปรับความสูงตามต้องการ
              width: 120.0, // ปรับความกว้างตามต้องการ
            ),
            SizedBox(height: 8.0),
            Text(title),
          ],
        ),
      ),
    );
  }
}
