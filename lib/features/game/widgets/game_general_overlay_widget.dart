import 'package:flutter/material.dart';

class GameGeneralOverlayWidget extends StatelessWidget {
  final Widget child;

  const GameGeneralOverlayWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return  Container(
        color: Color.fromRGBO(0, 0, 0, 0.77),
        child: Align(alignment: Alignment.bottomCenter, child: child),

    );
  }
}
