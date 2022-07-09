import 'package:blindside_task/data/video_model.dart';
import 'package:blindside_task/domain/cubit/comment_cubit.dart';
import 'package:blindside_task/presentation/widgets/chips/comment_chip.dart';
import 'package:blindside_task/presentation/widgets/chips/like_chip.dart';
import 'package:blindside_task/presentation/widgets/videos/video_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoParticularBundle extends StatelessWidget {
  final VideoModel videoModel;

  const VideoParticularBundle({
    Key? key,
    required this.videoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: double.infinity,
      height: 340,
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.07, right: width * 0.06),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoFrame(videoModel: videoModel),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Video Title',
                  style: GoogleFonts.josefinSans(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const LikeChip(),
                    const SizedBox(width: 20),
                    BlocBuilder<CommentCubit, CommentState>(
                      builder: (context, state) {
                        if (state is CommentShow) {
                          return const CommentChip(
                            navigate: false,
                            isActive: true,
                          );
                        }
                        return const CommentChip(
                          navigate: false,
                          isActive: false,
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
