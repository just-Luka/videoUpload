import 'package:blindside_task/domain/cubit/comment_cubit.dart';
import 'package:blindside_task/presentation/frames/center_frame.dart';
import 'package:blindside_task/presentation/widgets/dividers/video_divider.dart';
import 'package:blindside_task/presentation/widgets/videos/video_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoBottomSwitch extends StatefulWidget {
  const VideoBottomSwitch({Key? key}) : super(key: key);

  @override
  State<VideoBottomSwitch> createState() => _VideoBottomSwitchState();
}

class _VideoBottomSwitchState extends State<VideoBottomSwitch> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 600),
      child: BlocBuilder<CommentCubit, CommentState>(
        builder: (context, state) {
          if (state is CommentShow) {
            return AnimatedSwitcher(
              duration: const Duration(
                milliseconds: 200,
              ),
              child: CenterFrame(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Comments',
                        style: GoogleFonts.josefinSans(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                      Column(
                        children: state.comments.map((data) {
                          return VideoComment(commentText: data);
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Center(
              child: Column(
                children: [
                  CenterFrame(
                    child: Text(
                      'Related Videos',
                      style: GoogleFonts.josefinSans(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  const CenterFrame(
                    child: VideoDivider(),
                  ),
                  // const VideoRelatedBundle(),
                  // const VideoRelatedBundle(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
