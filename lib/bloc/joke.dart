import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:flutter_bloc/flutter_bloc.dart';

const JOKE_API_URL = "https://v2.jokeapi.dev/joke/Any?type=single";

class JokeState {
  String text;
  bool fetching;

  JokeState({this.text = '', this.fetching = false});
}

class JokeCubit extends Cubit<JokeState> {
  JokeCubit({populate: true}) : super(new JokeState()) {
    if (populate) {
      fetchJoke();
    }
  }

  void fetchJoke() async {
    emit(new JokeState(fetching: true));

    var response = await http
        .get(Uri.parse(JOKE_API_URL), headers: {"Accept": "application/json"});
    var data = json.decode(response.body);

    emit(new JokeState(text: data['joke']));
  }
}
