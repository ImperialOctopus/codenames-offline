import 'package:equatable/equatable.dart';

abstract class CodeImportEvent extends Equatable {
  const CodeImportEvent();

  @override
  List<Object> get props => [];
}

class CodeImportEventChanged extends CodeImportEvent {
  final String string;

  const CodeImportEventChanged(this.string);

  @override
  List<Object> get props => [string];
}
