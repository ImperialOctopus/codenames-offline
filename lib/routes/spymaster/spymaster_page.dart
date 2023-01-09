import 'package:codenames/routes/spymaster/affiliation_board.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/card_affiliation.dart';
import '../../theme/app_theme.dart';

class SpymasterPage extends StatefulWidget {
  final List<CardAffiliation> spymasterData;

  const SpymasterPage({super.key, required this.spymasterData});

  @override
  State<StatefulWidget> createState() => _SpymasterPageState();
}

class _SpymasterPageState extends State<SpymasterPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
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
    final appTheme = Provider.of<AppTheme>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
                  child: Stack(
                    children: [
                      AffiliationBoard(affiliations: widget.spymasterData),
                      Positioned(
                        left: 10,
                        bottom: 10,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: appTheme.alignmentNotchColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: OutlinedButton(
                child: const Text('rotate'),
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
}
