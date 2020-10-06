import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../service/secret_code_service.dart';
import 'code_import_event.dart';
import 'code_import_state.dart';

class CodeImportBloc extends Bloc<CodeImportEvent, CodeImportState> {
  final SecretCodeService _secretCodeService;

  CodeImportBloc({@required SecretCodeService secretCodeService})
      : _secretCodeService = secretCodeService,
        super(CodeImportStateInvalid());

  @override
  Stream<CodeImportState> mapEventToState(
    CodeImportEvent event,
  ) async* {
    if (event is CodeImportEventChanged) {
      yield* _mapCodeImportEventChangedToState(event);
    }
  }

  Stream<CodeImportState> _mapCodeImportEventChangedToState(
    CodeImportEventChanged event,
  ) async* {
    final list = _secretCodeService.decode(event.string);
    final valid = _secretCodeService.validateAffiliationList(list);
    if (valid) {
      yield CodeImportStateValid(list);
    } else {
      yield CodeImportStateInvalid();
    }
  }

  @override
  Future<void> close() {
    // Dispose of repositories
    return super.close();
  }
}
