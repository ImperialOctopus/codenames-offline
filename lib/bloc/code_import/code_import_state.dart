import 'package:equatable/equatable.dart';

import '../../model/card_affiliation.dart';

abstract class CodeImportState extends Equatable {
  const CodeImportState();

  @override
  List<Object> get props => [];
}

class CodeImportStateInvalid extends CodeImportState {
  const CodeImportStateInvalid();
}

class CodeImportStateValid extends CodeImportState {
  final List<CardAffiliation> list;

  const CodeImportStateValid(this.list);

  @override
  List<Object> get props => [list];
}
