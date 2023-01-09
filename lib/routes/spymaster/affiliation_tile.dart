import 'package:codenames/models/card_affiliation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme/app_theme.dart';

class AffiliationTile extends StatelessWidget {
  final CardAffiliation affiliation;
  final bool marked;

  const AffiliationTile(
      {super.key, required this.affiliation, this.marked = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Card(
          color: Provider.of<AppTheme>(context).affiliationToColor(affiliation),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
