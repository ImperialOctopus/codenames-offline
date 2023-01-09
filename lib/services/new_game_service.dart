import 'dart:math';

import '../models/card_affiliation.dart';
import '../models/code_card.dart';
import 'word_service.dart';

enum StartingTeam {
  red,
  blue,
  random,
}

class NewGameService {
  static const int totalCards = 25;
  static const int startingTeamCards = 9;
  static const int secondTeamCards = 8;
  static const int assassinCards = 1;

  final WordService wordService;

  NewGameService({required this.wordService});

  List<CodeCard> generateCardList(
      [StartingTeam startingTeam = StartingTeam.random]) {
    if (startingTeam == StartingTeam.random) {
      startingTeam =
          (Random().nextInt(2) == 0) ? StartingTeam.red : StartingTeam.blue;
    }

    return wordService
        .randomWordList(totalCards)
        .asMap()
        .map<int, CodeCard>((var i, var word) {
          if (i < startingTeamCards) {
            // Starting team
            return MapEntry<int, CodeCard>(
                i,
                CodeCard(
                    word: word,
                    affiliation: (startingTeam == StartingTeam.red)
                        ? CardAffiliation.red
                        : CardAffiliation.blue,
                    visible: false));
          } else if (i < startingTeamCards + secondTeamCards) {
            // Second team
            return MapEntry<int, CodeCard>(
                i,
                CodeCard(
                    word: word,
                    affiliation: (startingTeam == StartingTeam.red)
                        ? CardAffiliation.blue
                        : CardAffiliation.red,
                    visible: false));
          } else if (i < startingTeamCards + secondTeamCards + assassinCards) {
            // Assassin card
            return MapEntry<int, CodeCard>(
                i,
                CodeCard(
                    word: word,
                    affiliation: CardAffiliation.assassin,
                    visible: false));
          } else {
            // Bystander
            return MapEntry<int, CodeCard>(
                i,
                CodeCard(
                    word: word,
                    affiliation: CardAffiliation.neutral,
                    visible: false));
          }
        })
        .values
        .toList()
      ..shuffle();
  }
}
