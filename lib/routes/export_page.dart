import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/board_state.dart';
import '../services/secret_code_service.dart';

class ExportPage extends StatelessWidget {
  final BoardState? boardState;

  const ExportPage({required this.boardState});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: (boardState == null)
              ? [
                  Text(
                    'no game data found',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  ElevatedButton(
                      child: Text('Back'),
                      onPressed: () => Navigator.of(context).pop()),
                ]
              : [
                  Text('spymaster code',
                      style: Theme.of(context).textTheme.headlineMedium),
                  SelectableText(
                    Provider.of<SecretCodeService>(context).encode(boardState!
                        .cards
                        .map((card) => card.affiliation)
                        .toList()),
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
        ),
      ),
    );
  }
}
