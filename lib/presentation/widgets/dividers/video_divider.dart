import 'package:flutter/material.dart';

class VideoDivider extends StatelessWidget {
  const VideoDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Color.fromRGBO(66, 66, 66, 1),
      thickness: 2.5,
    );
  }
}
