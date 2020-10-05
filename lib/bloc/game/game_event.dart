import 'package:equatable/equatable.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

class GameEventNew extends GameEvent {}

class GameEventFlip extends GameEvent {
  final int flipIndex;

  const GameEventFlip(this.flipIndex);

  @override
  List<Object> get props => [flipIndex];
}
