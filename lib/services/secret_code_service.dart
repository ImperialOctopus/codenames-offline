import 'package:baseconvert/baseconvert.dart' as baseconvert;

import '../models/card_affiliation.dart';
import 'new_game_service.dart';

class SecretCodeService {
  String encode(List<CardAffiliation> list) {
    final string = list.map((aff) => aff.index).join();
    return baseconvert
        .base(string, inBase: 4, outBase: 36, string: true)
        .toString();
  }

  List<CardAffiliation> decode(String string) {
    try {
      final fourString =
          (baseconvert.base(string, inBase: 36, outBase: 4) as List<dynamic>)
              .map((dynamic e) => e.toString())
              .toList();
      final b = fourString.map((i) => int.parse(i.toString())).toList();
      final result = b.map((val) => CardAffiliation.values[val]).toList();
      while (result.length < 25) {
        result.insert(0, CardAffiliation.neutral);
      }
      return result;
    } on Exception {
      return [];
    }
  }

  bool validateAffiliationList(List<CardAffiliation> list) {
    final redCards =
        list.where((element) => element == CardAffiliation.red).length;
    final blueCards =
        list.where((element) => element == CardAffiliation.blue).length;
    final assassins =
        list.where((element) => element == CardAffiliation.assassin).length;

    if (list.length != NewGameService.totalCards) {
      return false;
    }
    if (assassins != NewGameService.assassinCards) {
      return false;
    }

    if (redCards == NewGameService.startingTeamCards &&
        blueCards == NewGameService.secondTeamCards) {
      return true;
    } else if (blueCards == NewGameService.startingTeamCards &&
        redCards == NewGameService.secondTeamCards) {
      return true;
    } else {
      return false;
    }
  }
}
