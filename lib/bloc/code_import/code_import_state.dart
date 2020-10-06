import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class CodeImportState extends Equatable {
  final String string;
  final bool valid;

  const CodeImportState({@required this.string, @required this.valid});

  @override
  List<Object> get props => [string, valid];
}

class CodeImportStateEmpty extends CodeImportState {
  const CodeImportStateEmpty() : super(string: '', valid: false);
}

class CodeImportStateFilled extends CodeImportState {
  const CodeImportStateFilled({String string, bool valid})
      : super(string: string, valid: valid);
}
