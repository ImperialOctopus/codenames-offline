import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/code_import/code_import_bloc.dart';
import '../bloc/code_import/code_import_state.dart';
import '../models/card_affiliation.dart';

class SpymasterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SpymasterScreenState();
}

class _SpymasterScreenState extends State<SpymasterScreen>
    with SingleTickerProviderStateMixin {
  static const Color neutralColor = Color.fromARGB(255, 245, 230, 200);
  static final Color redColor = Colors.red[400];
  static final Color blueColor = Colors.blue[400];
  static const Color assassinColor = Colors.black;

  static final Color cornerColor = Color.fromARGB(255, 181, 51, 70);

  static const double gridSpacing = 0;
  static const double tileCornerRadius = 10;

  AnimationController _controller;
  Animation<double> _animation;
  int rotation = 0;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _controller.value = 1;
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        Text('no game data found'),
        OutlinedButton(
            child: Text('back'), onPressed: () => Navigator.of(context).pop()),
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
                child: RotationTransition(
                  turns:
                      Tween(begin: (rotation - 1) * 0.25, end: rotation * 0.25)
                          .animate(_animation),
                  child: _tileSet(context, state),
                ),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: OutlinedButton(
                child: Text('rotate'),
                onPressed: () => setState(() {
                  rotation++;
                  _controller.reset();
                  _controller.forward();
                }),
              ),
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
              color: cornerColor,
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
