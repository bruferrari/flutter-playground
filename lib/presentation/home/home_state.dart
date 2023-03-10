import 'package:english_words/english_words.dart';

class HomeState {
  WordPair current = WordPair.random();
  List<WordPair> favorites = List.empty();

  HomeState(this.current, this.favorites);

  HomeState.empty() {
    current = WordPair.random();
    favorites = List.empty();
  }

  WordPair getCurrent() => current;
  List<WordPair> getFavorites() => favorites;

  void setCurrent(WordPair current) {
    this.current = current;
  }

  void setFavorites(List<WordPair> favorites) {
    this.favorites = favorites;
  }
}
