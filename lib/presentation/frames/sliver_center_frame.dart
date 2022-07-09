import 'package:flutter/material.dart';

class SliverCenterFrame extends StatelessWidget {
  final Widget sliver;

  const SliverCenterFrame({
    Key? key,
    required this.sliver,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return SliverSafeArea(
      bottom: false,
      sliver: SliverPadding(
        padding: EdgeInsets.only(
          left: width * 0.05,
          right: width * 0.05,
        ),
        sliver: sliver,
      ),
    );
  }
}
