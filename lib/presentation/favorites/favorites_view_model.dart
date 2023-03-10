import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/data/words_repository.dart';

class FavoritesViewModel with ChangeNotifier {
  WordsRepository _repository = WordsRepository();

  FavoritesState getFavoritesState() {
    var favorites = _repository.getFavorites();
    return FavoritesState(favorites);
  }
}

class FavoritesState {
  List<WordPair> favorites = List.empty();

  FavoritesState(this.favorites);

  FavoritesState.empty() {
    favorites = List.empty();
  }
}
