import 'package:flutter/material.dart';

class ImportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Import Screen'),
            TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Enter a search term'),
            ),
          ],
        ),
      ),
    );
  }
}
