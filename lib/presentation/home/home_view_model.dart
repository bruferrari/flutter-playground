import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/data/words_repository.dart';

import '../../utils/pair.dart';

class HomeViewModel with ChangeNotifier {
  WordsRepository _repository;

  HomeViewModel(this._repository);

  String current = WordPair.random().asLowerCase.toString();

  void getNext() {
    current = WordPair.random().asLowerCase.toString();

    notifyListeners();
  }

  void toggleFavorite() {
    _repository.favorites.contains(current)
        ? _repository.removeFavorite(current)
        : _repository.addFavorite(current);

    notifyListeners();
  }

  Pair<String, IconData> getStyling() => _repository.favorites.contains(current)
      ? Pair('Remove', Icons.favorite)
      : Pair('Like', Icons.favorite_border_outlined);
}
