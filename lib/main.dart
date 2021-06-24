import 'package:flutter/material.dart';

import 'package:flutter_melange/routes.dart' as Routes;
import 'package:flutter_melange/screens/counter.dart';
import 'package:flutter_melange/screens/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Melange',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: Routes.HOME,
      routes: {
        Routes.HOME: (context) => HomeScreen(),
        Routes.COUNTER: (context) => CounterScreen(),
      },
    );
  }
}
