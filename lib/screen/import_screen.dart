import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/code_import/code_import_bloc.dart';
import '../bloc/code_import/code_import_event.dart';
import '../bloc/code_import/code_import_state.dart';

class ImportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text('Import Screen'),
            TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter spymaster code...'),
              onChanged: (string) => BlocProvider.of<CodeImportBloc>(context)
                  .add(CodeImportEventChanged(string.toUpperCase().trim())),
            ),
            BlocBuilder<CodeImportBloc, CodeImportState>(
                bloc: BlocProvider.of<CodeImportBloc>(context),
                builder: (var context, state) {
                  if (state is CodeImportStateValid) {
                    return RaisedButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/spymaster'),
                      child: Text('View Board'),
                    );
                  } else {
                    return RaisedButton(
                      onPressed: null,
                      child: Text('Invalid Code'),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
