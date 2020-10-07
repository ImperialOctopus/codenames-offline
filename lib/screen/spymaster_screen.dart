import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../bloc/code_import/code_import_bloc.dart';
import '../bloc/code_import/code_import_state.dart';
import '../model/card_affiliation.dart';

class SpymasterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SpymasterScreenState();
}

class _SpymasterScreenState extends State<SpymasterScreen> {
  static const Color neutralColor = Color.fromARGB(255, 245, 230, 200);
  static final Color redColor = Colors.red[400];
  static final Color blueColor = Colors.blue[400];
  static const Color assassinColor = Colors.black;

  static const Color iconColor = Color.fromARGB(100, 0, 0, 0);
  static const Color iconColorLight = Colors.white;

  static const double gridSpacing = 0;
  static const double tileCornerRadius = 10;

  int rotation = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CodeImportBloc, CodeImportState>(
          bloc: BlocProvider.of<CodeImportBloc>(context),
          builder: (var context, state) {
            if (state is CodeImportStateValid) {
              return _buildBoard(context, state);
            } else if (state is CodeImportStateInvalid) {
              return _buildInvalid(context);
            } else {
              throw FallThroughError();
            }
          }),
    );
  }

  Widget _buildInvalid(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('No game data found'),
        OutlinedButton(
            child: Text('Back'), onPressed: () => Navigator.of(context).pop()),
      ],
    ));
  }

  Widget _buildBoard(BuildContext context, CodeImportStateValid state) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Align(
              child: AspectRatio(
                aspectRatio: 1,
                child: RotatedBox(
                  quarterTurns: rotation,
                  child: _tileSet(context, state),
                ),
              ),
            ),
          ),
          Flexible(
            child: OutlinedButton(
              child: Text('Rotate'),
              onPressed: () => setState(() => rotation++),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tileSet(BuildContext context, CodeImportStateValid state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            _markedTileBuilder(context, state.list.first),
            ...state.list
                .skip(1)
                .take(4)
                .map((aff) => _tileBuilder(context, aff))
                .toList(),
          ]),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: state.list
                .skip(5)
                .take(5)
                .map((aff) => _tileBuilder(context, aff))
                .toList(),
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: state.list
                .skip(10)
                .take(5)
                .map((aff) => _tileBuilder(context, aff))
                .toList(),
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: state.list
                .skip(15)
                .take(5)
                .map((aff) => _tileBuilder(context, aff))
                .toList(),
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: state.list
                .skip(20)
                .take(5)
                .map((aff) => _tileBuilder(context, aff))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _markedTileBuilder(BuildContext context, CardAffiliation aff) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(gridSpacing),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Card(
              color: Theme.of(context).accentColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(tileCornerRadius)),
            ),
            ClipPath(
              clipper: ShapeBorderClipper(
                  shape: BeveledRectangleBorder(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(40)))),
              child: Card(
                color: _affiliationColor(aff),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(tileCornerRadius)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _affiliationColor(CardAffiliation aff) {
    switch (aff) {
      case CardAffiliation.neutral:
        return neutralColor;
      case CardAffiliation.red:
        return redColor;
      case CardAffiliation.blue:
        return blueColor;
      case CardAffiliation.assassin:
        return assassinColor;
      default:
        throw FallThroughError();
    }
  }

  Widget _tileBuilder(BuildContext context, CardAffiliation aff) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(gridSpacing),
        child: Card(
          color: _affiliationColor(aff),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(tileCornerRadius)),
        ),
      ),
    );
  }
}
