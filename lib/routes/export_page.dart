import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/board_state.dart';
import '../services/secret_code_service.dart';

class ExportPage extends StatelessWidget {
  final BoardState boardState;

  const ExportPage({super.key, required this.boardState});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('spymaster code',
                style: Theme.of(context).textTheme.headlineMedium),
            SelectableText(
              Provider.of<SecretCodeService>(context).encode(
                  boardState.cards.map((card) => card.affiliation).toList()),
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}
