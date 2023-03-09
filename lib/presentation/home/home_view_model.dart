import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/presentation/home/home_state.dart';

class HomeViewModel extends ChangeNotifier {
  HomeState state = HomeState.empty();

  var current = WordPair.random();
  var favorites = <WordPair>[];

  void getNext() {
    current = WordPair.random();
    state.setCurrent(current);

    notifyListeners();
  }

  void toggleFavorites() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }

    state.setFavorites(favorites);

    notifyListeners();
  }
}
