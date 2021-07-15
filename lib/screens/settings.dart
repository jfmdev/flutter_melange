import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_melange/bloc/theme.dart';
import 'package:flutter_melange/widgets/drawer.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key, required this.analytics}) : super(key: key);

  final FirebaseAnalytics analytics;

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  static const title = "Settings";

  void _toggleThemeColor(BuildContext context, bool isDark) {
    context.read<ThemeCubit>().toggle();

    widget.analytics.logEvent(
      name: 'theme_brightness',
      parameters: <String, dynamic>{'dark': isDark},
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, isDark) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: MyDrawer(),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Transform.scale(
                scale: 2,
                child: Switch(
                  onChanged: (newValue) => _toggleThemeColor(context, newValue),
                  value: isDark,
                  activeColor: Theme.of(context).accentColor,
                )),
            Text(
              'Dark theme: ${isDark ? "YES" : "No"}',
              style: TextStyle(fontSize: 20),
            )
          ]),
        ),
      ),
    );
  }
}
