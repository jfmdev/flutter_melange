import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import 'package:flutter_melange/widgets/drawer.dart';

class CounterScreen extends StatefulWidget {
  CounterScreen({Key? key, required this.analytics}) : super(key: key);

  final FirebaseAnalytics analytics;

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  static const title = "Counter";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    widget.analytics.logEvent(
      name: 'tap_counter',
      parameters: <String, dynamic>{
        'count': _counter
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
