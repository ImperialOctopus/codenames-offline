import 'dart:math';

import 'package:codenames/model/card_affiliation.dart';

import '../model/card.dart';
import 'word_service.dart';

enum StartingTeam {
  red,
  blue,
  random,
}

const int totalCards = 25;
const int startingTeamCards = 9;
const int secondTeamCards = 8;
const int assassinCards = 1;

class NewGameService {
  final WordService wordService;

  NewGameService(this.wordService);

  Future<List<Card>> generateCardList(
      [StartingTeam startingTeam = StartingTeam.random]) async {
    if (startingTeam == StartingTeam.random) {
      startingTeam =
          (Random().nextInt(1) == 0) ? StartingTeam.red : StartingTeam.blue;
    }

    return wordService
        .randomWordList(totalCards)
        .asMap()
        .map<int, Card>((var i, var word) {
          if (i < startingTeamCards) {
            // Starting team
            return MapEntry<int, Card>(
                i,
                Card(
                    word: word,
                    affiliation: (startingTeam == StartingTeam.red)
                        ? CardAffiliation.red
                        : CardAffiliation.blue,
                    visible: false));
          } else if (i < startingTeamCards + secondTeamCards) {
            // Second team
            return MapEntry<int, Card>(
                i,
                Card(
                    word: word,
                    affiliation: (startingTeam == StartingTeam.red)
                        ? CardAffiliation.blue
                        : CardAffiliation.red,
                    visible: false));
          } else if (i < startingTeamCards + secondTeamCards + assassinCards) {
            // Assassin card
            return MapEntry<int, Card>(
                i,
                Card(
                    word: word,
                    affiliation: CardAffiliation.assassin,
                    visible: false));
          } else {
            // Bystander
            return MapEntry<int, Card>(
                i,
                Card(
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
