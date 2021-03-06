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
        super(GameStateEmpty());

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
    yield GameStatePlaying(cardList);
  }

  Stream<GameState> _mapGameEventFlipToState(
    GameEventFlip event,
  ) async* {
    if (state is GameStatePlaying) {
      var cardList = (state as GameStatePlaying).cards.toList();
      var flipIndex = event.flipIndex;

      cardList[flipIndex] =
          cardList[flipIndex].copyWith(visible: !cardList[flipIndex].visible);

      yield GameStatePlaying(cardList);
    } else {
      throw StateError('Tried to flip card with an empty game state');
    }
  }

  @override
  Future<void> close() {
    // Dispose of repositories
    return super.close();
  }
}
