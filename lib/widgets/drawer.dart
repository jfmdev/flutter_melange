import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_melange/routes.dart' as Routes;

class MyDrawer extends StatelessWidget {
  void pushRouteIfNeed(BuildContext context, String routeName) {
    var currentRoute = ModalRoute.of(context)?.settings.name;

    if (currentRoute != routeName) {
      Navigator.popAndPushNamed(
        context,
        routeName,
      );
    } else {
      Navigator.pop(context);
    }
  }

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
              pushRouteIfNeed(context, Routes.HOME);
            },
          ),
          ListTile(
            title: Text('Counter'),
            leading: FaIcon(FontAwesomeIcons.calculator),
            onTap: () {
              pushRouteIfNeed(context, Routes.COUNTER);
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
