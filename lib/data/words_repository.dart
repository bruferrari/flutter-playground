import 'package:english_words/english_words.dart';
import '../service/words_service.dart';

class WordsRepository {
  WordsService _service = WordsService();

  List<WordPair> getFavorites() => _service.getFavorites();

  void addFavorite(WordPair wordPair) {
    _service.addFavorite(wordPair);
  }
}
