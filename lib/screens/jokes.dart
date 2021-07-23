import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_melange/bloc/joke.dart';
import 'package:flutter_melange/widgets/drawer.dart';

class JokesScreen extends StatefulWidget {
  JokesScreen({Key? key, required this.analytics}) : super(key: key);

  final FirebaseAnalytics analytics;

  @override
  _JokesScreenState createState() => _JokesScreenState();
}

class _JokesScreenState extends State<JokesScreen> {
  static const title = "Jokes";

  void _fetchJoke(BuildContext context) {
    var cubit = context.read<JokeCubit>();
    if (!cubit.state.fetching) {
      cubit.fetchJoke();

      widget.analytics.logEvent(name: 'new_joke');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JokeCubit, JokeState>(
      builder: (context, joke) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: MyDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              joke.fetching
                  ? CupertinoActivityIndicator()
                  : Text(
                      joke.text,
                      style: Theme.of(context).textTheme.headline4,
                    ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _fetchJoke(context),
          tooltip: 'Get another joke',
          child: Icon(joke.fetching ? Icons.watch_later_outlined : Icons.sync),
        ),
      ),
    );
  }
}
