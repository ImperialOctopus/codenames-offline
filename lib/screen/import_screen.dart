import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/code_import/code_import_bloc.dart';
import '../bloc/code_import/code_import_event.dart';
import '../bloc/code_import/code_import_state.dart';

class ImportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Import Screen'),
            BlocBuilder<CodeImportBloc, CodeImportState>(
                bloc: BlocProvider.of<CodeImportBloc>(context),
                builder: (var context, state) {
                  return Text(state.valid.toString());
                }),
            TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter spymaster code...'),
              onChanged: (string) => BlocProvider.of<CodeImportBloc>(context)
                  .add(CodeImportEventChanged(string)),
            ),
          ],
        ),
      ),
    );
  }
}
