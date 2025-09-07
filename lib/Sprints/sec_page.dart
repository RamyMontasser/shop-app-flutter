import 'package:flutter/material.dart';
import 'settings.dart';
import 'profile.dart';
import 'home.dart';

class SecPage extends StatefulWidget {
  const SecPage({super.key});

  @override
  State<SecPage> createState() => _SecPageState();
}

class _SecPageState extends State<SecPage> {
  int pagenum = 0;
  List pages = [Home(), Profile(), Settings()];
  String title = 'Our Products';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.white,
      ),
      drawer: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.8,
        child: ListView(
          children: [
            SizedBox(height: 150),
            ListTile(
              title: Text("Contact Info"),
              subtitle: Text("ramy.montasser@gmail.com"),
              trailing: Icon(Icons.mail),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              title: Text("Log out"),
              trailing: Icon(Icons.logout),
            ),
          ],
        ),
      ),
      body: pages[pagenum],

      bottomNavigationBar: BottomNavigationBar(
        onTap: ontapped,
        items: [
          BottomNavigationBarItem(label: "home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "profile", icon: Icon(Icons.person)),
          BottomNavigationBarItem(
            label: "sittings",
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }

  ontapped(int index) {
    pagenum = index;
    if (index == 1) {
      title = "Profile";
    } else if (index == 2) {
      title = "Settings";
    } else {
      title = "Our Products";
    }
    setState(() {});
  }
}
