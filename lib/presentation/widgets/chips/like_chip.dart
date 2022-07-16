import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LikeChip extends StatefulWidget {
  final int likes;

  const LikeChip({
    Key? key,
    required this.likes,
  }) : super(key: key);

  @override
  State<LikeChip> createState() => _LikeChipState();
}

class _LikeChipState extends State<LikeChip> {
  bool _isLiked = false;

  void _setIsLiked() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      onPressed: () {
        _setIsLiked();
      },
      label: Row(
        children: [
          Icon(
            Icons.favorite,
            color: _isLiked ? const Color.fromRGBO(66, 66, 66, 1) : Colors.red,
          ),
          Text(
            _isLiked ? (widget.likes + 1).toString() : widget.likes.toString(),
            style: GoogleFonts.josefinSans(
                color: _isLiked
                    ? const Color.fromRGBO(66, 66, 66, 1)
                    : Colors.grey.shade400),
          ),
        ],
      ),
      backgroundColor:
          _isLiked ? Colors.red : const Color.fromRGBO(66, 66, 66, 1),
    );
  }
}
