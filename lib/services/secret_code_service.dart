import 'package:any_base/any_base.dart';

import '../models/card_affiliation.dart';
import 'new_game_service.dart';

class SecretCodeService {
  static const codeSet = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  static const cardSet = '0123';
  static const converter = AnyBase(cardSet, codeSet);

  String encode(List<CardAffiliation> list) {
    final string = list.map((aff) => aff.index).join();
    return converter.convert(string);
  }

  List<CardAffiliation> decode(String string) {
    try {
      final cardList = converter.revert(string).split('').map(int.parse);
      final result =
          cardList.map((val) => CardAffiliation.values[val]).toList();
      while (result.length < 25) {
        result.insert(0, CardAffiliation.neutral);
      }
      return result;
    } catch (e) {
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
