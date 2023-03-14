import 'package:flutter/material.dart';
import 'package:namer_app/data/words_repository.dart';

class FavoritesViewModel with ChangeNotifier {
  WordsRepository _repository = WordsRepository();

  Future<FavoritesState> getFavoritesState() async {
    await _repository.getFavorites();
    return FavoritesState(_repository.favorites);
  }
}

class FavoritesState {
  List<String> favorites = List.empty();

  FavoritesState(this.favorites);

  FavoritesState.empty() {
    favorites = List.empty();
  }
}
