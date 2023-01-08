import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../extensions/uppercase_text_formatter.dart';
import '../services/secret_code_service.dart';

class ImportPage extends StatefulWidget {
  @override
  State<ImportPage> createState() => _ImportPageState();
}

class _ImportPageState extends State<ImportPage> {
  late final SecretCodeService secretCodeService;

  String? secretCode;

  @override
  void initState() {
    super.initState();
    secretCodeService = Provider.of<SecretCodeService>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('spymaster code',
                style: Theme.of(context).textTheme.displaySmall),
            Container(height: 20),
            Container(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(),
                  ),
                ),
                textAlign: TextAlign.center,
                inputFormatters: [
                  UpperCaseTextFormatter(),
                ],
                maxLines: null,
                style: Theme.of(context).textTheme.headlineMedium,
                onChanged: _onCodeChanged,
              ),
            ),
            Container(height: 20),
            if (secretCode != null)
              OutlinedButton(
                onPressed: () => Navigator.of(context).pushNamed('/spymaster'),
                child: Text('view board'),
              )
            else
              OutlinedButton(
                onPressed: null,
                child: Text('code invalid'),
              ),
          ],
        ),
      ),
    );
  }

  void _onCodeChanged(String string) {
    final safeString = string.toUpperCase().trim();

    final list = secretCodeService.decode(safeString);
    final valid = secretCodeService.validateAffiliationList(list);

    setState(() {
      if (valid) {
        secretCode = safeString;
      } else {
        secretCode = null;
      }
    });
  }
}
