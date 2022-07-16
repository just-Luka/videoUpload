import 'dart:math';

import 'package:blindside_task/data/video_model.dart';
import 'package:blindside_task/presentation/widgets/chips/comment_chip.dart';
import 'package:blindside_task/presentation/widgets/chips/like_chip.dart';
import 'package:flutter/material.dart';

class VideoMetaData extends StatelessWidget {
  final VideoModel videoModel;

  const VideoMetaData({
    Key? key,
    required this.videoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LikeChip(
          likes: videoModel.likes,
        ),
        CommentChip(
          navigate: true,
          isActive: false,
          videoModel: videoModel,
        ),
      ],
    );
  }
}
