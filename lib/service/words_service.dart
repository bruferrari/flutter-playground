import 'package:english_words/english_words.dart';

class WordsService {
  static final WordsService _wordsService = WordsService._internal();

  WordsService._internal();

  factory WordsService() {
    return _wordsService;
  }

  List<WordPair> _favorites = List.empty(growable: true);

  List<WordPair> getFavorites() => _favorites;

  void addFavorite(WordPair wordPair) {
    _favorites.add(wordPair);
  }
}
