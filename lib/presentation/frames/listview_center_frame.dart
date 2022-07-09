import 'package:flutter/material.dart';

class ListViewCenterFrame extends StatelessWidget {
  final int index;
  final Widget child;
  final double itemDistance;

  const ListViewCenterFrame(
      {Key? key,
      required this.index,
      required this.child,
      required this.itemDistance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: index == 0
          ? EdgeInsets.only(left: width * 0.05)
          : EdgeInsets.only(left: itemDistance),
      child: child,
    );
  }
}
