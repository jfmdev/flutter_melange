import 'package:flutter/material.dart';

final appTextTheme = TextTheme(
  headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
  bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
);

final lightTheme = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.light,
  primaryColor: Colors.lightBlue[800],
  accentColor: Colors.cyan[600],

  // Define the default font family.
  fontFamily: 'Georgia',

  // Define the default TextTheme.
  textTheme: appTextTheme,
);

final darkTheme = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.dark,
  primaryColor: Colors.lightGreen[800],
  accentColor: Colors.limeAccent[600],

  // Define the default font family.
  fontFamily: 'Roboto',

  // Define the default TextTheme.
  textTheme: appTextTheme,
);
