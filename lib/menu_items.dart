import 'package:flutter/material.dart';
import 'menu/settings.dart';
import 'menu/credits.dart';
import 'menu/termsandconditions.dart';
import 'menu/profile.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileApp()),
                );
              },
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile_picture.png'),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'johndoe@example.com',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 32.0),
            ListTile(
              leading: Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
                // Handle settings navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: const Text('Credits'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Credits(),
                  ),
                );
                // Handle credits navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: const Text('Terms and Conditions'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TermsandConditions(),
                  ),
                );
                // Handle terms and conditions navigation
              },
            ),
            // Add more ListTile widgets for other menu options
          ],
        ),
      ),
    );
  }
}
