import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_melange/screens/counter.dart';
import 'package:flutter_melange/screens/home.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.indigo,
                ),
                child: Container(
                  child: Text("Menu", style: TextStyle(color: Colors.white)),
                  alignment: Alignment.centerLeft, // <-- ALIGNMENT
                  height: 50,
                ),
              ),
              height: 100),
          ListTile(
            title: Text('Home'),
            leading: FaIcon(FontAwesomeIcons.home),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Counter'),
            leading: FaIcon(FontAwesomeIcons.calculator),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CounterScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Close'),
            leading: FaIcon(FontAwesomeIcons.times),
            onTap: () {
              // Close the drawer.
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
