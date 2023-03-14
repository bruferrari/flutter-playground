import 'package:shared_preferences/shared_preferences.dart';

class WordsRepository {
  List<String> favorites = List.empty(growable: true);
  final _prefs = SharedPreferences.getInstance();

  static const _wordsKey = 'words';

  WordsRepository() {
    getFavorites();
  }

  Future<void> getFavorites() async {
    final prefs = await _prefs;
    final words = prefs.getString(_wordsKey);

    if (words == null) return;

    var wordList = words.split('\n');
    favorites.addAll(wordList);
  }

  Future<void> addFavorite(String word) async {
    favorites.add(word);

    await _setFavorites();
  }

  Future<void> removeFavorite(String word) async {
    favorites.remove(word);

    await _setFavorites();
  }

  Future<void> _setFavorites() async {
    var favoritesAsString = _mapToString(favorites);
    final prefs = await _prefs;
    await prefs.setString(_wordsKey, favoritesAsString);
  }

  String _mapToString(List<String> favorites) {
    var buffer = StringBuffer();
    for (var favorite in favorites) {
      buffer.write('$favorite\n');
    }

    return buffer.toString();
  }
}
