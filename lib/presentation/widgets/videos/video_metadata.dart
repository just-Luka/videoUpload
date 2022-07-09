import 'package:blindside_task/presentation/widgets/chips/comment_chip.dart';
import 'package:blindside_task/presentation/widgets/chips/like_chip.dart';
import 'package:flutter/material.dart';

class VideoMetaData extends StatelessWidget {
  const VideoMetaData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        LikeChip(),
        CommentChip(
          navigate: true,
          isActive: false,
        ),
      ],
    );
  }
}
