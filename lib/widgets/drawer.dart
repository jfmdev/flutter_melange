import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import 'package:flutter_melange/routes.dart' as Routes;
import 'package:flutter_melange/utils/geolocation.dart';

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
                  color: Theme.of(context).accentColor,
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
            title: Text('Where am I?'),
            leading: FaIcon(FontAwesomeIcons.mapMarked),
            onTap: () async {
              Position? location = await getCurrentLocation();
              final lat = location?.latitude ?? 25.0;
              final lon = location?.longitude ?? 25.0;

              final url =
                  'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
              await UrlLauncher.launch(url);
            },
          ),
          ListTile(
            title: Text('Tell me a joke'),
            leading: FaIcon(FontAwesomeIcons.crown),
            onTap: () {
              pushRouteIfNeed(context, Routes.JOKES);
            },
          ),
          ListTile(
            title: Text('Settings'),
            leading: FaIcon(FontAwesomeIcons.cog),
            onTap: () {
              pushRouteIfNeed(context, Routes.SETTINGS);
            },
          ),
          ListTile(
            title: Text('Close menu'),
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
