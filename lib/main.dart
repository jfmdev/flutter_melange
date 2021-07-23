import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter_melange/theme.dart';
import 'package:flutter_melange/routes.dart' as Routes;
import 'package:flutter_melange/bloc/counter.dart';
import 'package:flutter_melange/bloc/joke.dart';
import 'package:flutter_melange/bloc/theme.dart';
import 'package:flutter_melange/screens/counter.dart';
import 'package:flutter_melange/screens/home.dart';
import 'package:flutter_melange/screens/jokes.dart';
import 'package:flutter_melange/screens/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
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

          return MultiBlocProvider(
            providers: [
              BlocProvider<ThemeCubit>(
                create: (BuildContext context) => ThemeCubit(),
              ),
              BlocProvider<CounterCubit>(
                create: (BuildContext context) => CounterCubit(),
              ),
              BlocProvider<JokeCubit>(
                create: (BuildContext context) => JokeCubit(),
              ),
            ],
            child: BlocBuilder<ThemeCubit, bool>(
              builder: (context, isDark) => MaterialApp(
                title: 'Flutter Melange',
                theme: isDark ? darkTheme : lightTheme,
                initialRoute: Routes.HOME,
                routes: {
                  Routes.HOME: (context) => HomeScreen(),
                  Routes.COUNTER: (context) =>
                      CounterScreen(analytics: analytics),
                  Routes.JOKES: (context) => JokesScreen(analytics: analytics),
                  Routes.SETTINGS: (context) =>
                      SettingsScreen(analytics: analytics),
                },
                navigatorObservers: [
                  FirebaseAnalyticsObserver(analytics: analytics)
                ],
              ),
            ),
          );
        });
  }
}
