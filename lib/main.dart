import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_melange/theme.dart';
import 'package:flutter_melange/routes.dart' as Routes;
import 'package:flutter_melange/bloc/counter.dart';
import 'package:flutter_melange/screens/counter.dart';
import 'package:flutter_melange/screens/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          FirebaseAnalytics analytics = FirebaseAnalytics();

          return MaterialApp(
            title: 'Flutter Melange',
            theme: appTheme,
            initialRoute: Routes.HOME,
            routes: {
              Routes.HOME: (context) => HomeScreen(),
              Routes.COUNTER: (context) => BlocProvider(
                    create: (BuildContext context) => CounterCubit(),
                    child: CounterScreen(analytics: analytics),
                  ),
            },
            navigatorObservers: [
              FirebaseAnalyticsObserver(analytics: analytics)
            ],
          );
        });
  }
}
