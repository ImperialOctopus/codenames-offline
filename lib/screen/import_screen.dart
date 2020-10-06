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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('spymaster code',
                style: Theme.of(context).textTheme.headline3),
            Container(height: 20),
            Container(
              width: 200,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(),
                  ),
                ),
                style: Theme.of(context).textTheme.headline4,
                onChanged: (string) => BlocProvider.of<CodeImportBloc>(context)
                    .add(CodeImportEventChanged(string.toUpperCase().trim())),
              ),
            ),
            Container(height: 20),
            BlocBuilder<CodeImportBloc, CodeImportState>(
                bloc: BlocProvider.of<CodeImportBloc>(context),
                builder: (var context, state) {
                  if (state is CodeImportStateValid) {
                    return OutlinedButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/spymaster'),
                      child: Text('view board'),
                    );
                  } else {
                    return OutlinedButton(
                      onPressed: null,
                      child: Text('code invalid'),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
