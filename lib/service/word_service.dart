import 'dart:math';

import '../data/wordlist.dart' as wordlist_data;

class WordService {
  String randomWord() =>
      wordlist_data.wordlist[Random().nextInt(wordlist_data.wordlist.length)];

  List<String> randomWordList(int length) =>
      (wordlist_data.wordlist.toList()..shuffle()).take(length).toList();
}
