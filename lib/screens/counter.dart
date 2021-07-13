import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_melange/bloc/counter.dart';

import 'package:flutter_melange/widgets/drawer.dart';

class CounterScreen extends StatefulWidget {
  CounterScreen({Key? key, required this.analytics}) : super(key: key);

  final FirebaseAnalytics analytics;

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  static const title = "Counter";

  void _incrementCounter(BuildContext context, int count) {
    context.read<CounterCubit>().increment();

    widget.analytics.logEvent(
      name: 'tap_counter',
      parameters: <String, dynamic>{'count': count},
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, int>(
      builder: (context, count) => Scaffold(
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
                '$count',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _incrementCounter(context, count),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
