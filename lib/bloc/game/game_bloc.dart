import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../service/new_game_service.dart';
import 'game_event.dart';
import 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final NewGameService _newGameService;

  GameBloc({@required NewGameService newGameService})
      : _newGameService = newGameService,
        super(const GameState.unknown());

  @override
  Stream<GameState> mapEventToState(
    GameEvent event,
  ) async* {
    if (event is GameEventNew) {
      yield* _mapGameEventNewToState(event);
    } else if (event is GameEventFlip) {
      yield* _mapGameEventFlipToState(event);
    }
  }

  Stream<GameState> _mapGameEventNewToState(
    GameEventNew event,
  ) async* {
    var cardList = await _newGameService.generateCardList();
    yield GameState.playing(cardList);
  }

  Stream<GameState> _mapGameEventFlipToState(
    GameEventFlip event,
  ) async* {
    var cardList = state.cards;
    var flipIndex = event.flipIndex;

    cardList[flipIndex] = cardList[flipIndex].copyWith(visible: true);

    yield GameState.playing(cardList);
  }

  @override
  Future<void> close() {
    // Dispose of repositories
    return super.close();
  }
}
