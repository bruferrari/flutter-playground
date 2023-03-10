import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/data/words_repository.dart';
import 'package:namer_app/presentation/home/home_state.dart';

class HomeViewModel with ChangeNotifier {
  WordsRepository _repository;

  HomeViewModel(this._repository);

  HomeState state = HomeState.empty();

  void getNext() {
    state.setCurrent(WordPair.random());

    notifyListeners();
  }

  void toggleFavorites() {
    List<WordPair> favorites = _repository.getFavorites();
    var current = state.getCurrent();

    favorites.contains(current)
        ? favorites.remove(current)
        : favorites.add(current);

    state.setFavorites(favorites);

    notifyListeners();
  }
}
