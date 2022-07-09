import 'package:flutter/material.dart';

class CenterFrame extends StatelessWidget {
  final Widget child;

  const CenterFrame({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        left: width * 0.05,
        right: width * 0.05,
      ),
      child: child,
    );
  }
}
