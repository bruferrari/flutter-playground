import 'package:english_words/english_words.dart';

class HomeState {
  WordPair current = WordPair.random();
  List<String> favorites = List.empty();

  HomeState(this.current, this.favorites);

  HomeState.empty() {
    current = WordPair.random();
    favorites = List.empty();
  }

  WordPair getCurrent() => current;
  List<String> getFavorites() => favorites;

  void setCurrent(WordPair current) {
    this.current = current;
  }

  void setFavorites(List<String> favorites) {
    this.favorites = favorites;
  }
}
