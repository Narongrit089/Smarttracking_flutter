import 'package:flutter/material.dart';
import 'sos_page.dart';
import 'phone_page.dart';
import 'tracking.dart';
import 'menu_health.dart';
import 'userinfo.dart';
import 'sett_page.dart';
import 'flashScreen.dart'; // Import the login page

class MenuPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the login page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100.0,
              width: 250.0,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SOSPage()),
                  );
                }),
                buildMenuItem('Phone', 'images/pa.png', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PhonePage()),
                  );
                }),
                buildMenuItem('Map', 'images/loca.png', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LocaPage()),
                  );
                }),
                buildMenuItem('Nurse', 'images/nurse.png', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MenuHPage()),
                  );
                }),
                buildMenuItem('Setting', 'images/settings.png', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserIfPage()),
                  );
                }),
                buildMenuItem('More', 'images/softwareS.png', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingPage()),
                  );
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
