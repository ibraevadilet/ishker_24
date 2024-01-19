import 'package:flutter/material.dart';

class FloatingBottomArea extends StatelessWidget {
  const FloatingBottomArea({
    Key? key,
    required this.child,
    required this.areaContent,
  }) : super(key: key);
  final Widget child;
  final Widget areaContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(child: child),
        areaContent,
      ],
    );
  }
}
