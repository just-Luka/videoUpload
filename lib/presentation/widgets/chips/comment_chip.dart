import 'package:blindside_task/data/video_model.dart';
import 'package:blindside_task/domain/cubit/comment_cubit.dart';
import 'package:blindside_task/presentation/pages/video_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentChip extends StatelessWidget {
  final bool isActive;
  final bool navigate;

  VideoModel? videoModel;

  CommentChip({
    Key? key,
    required this.navigate,
    required this.isActive,
    this.videoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      onPressed: () {
        BlocProvider.of<CommentCubit>(context).toggleComment();
        if (navigate) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoPage(videoModel: videoModel!),
            ),
          );
        }
      },
      label: isActive
          ? Row(
              children: [
                const Icon(
                  Icons.comment_rounded,
                  color: Color.fromRGBO(66, 66, 66, 1),
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  '66',
                  style: GoogleFonts.josefinSans(
                      color: const Color.fromRGBO(66, 66, 66, 1)),
                ),
              ],
            )
          : Row(
              children: [
                Icon(
                  Icons.comment_rounded,
                  color: Colors.grey.shade400,
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  '66',
                  style: GoogleFonts.josefinSans(color: Colors.grey.shade400),
                ),
              ],
            ),
      backgroundColor:
          isActive ? Colors.grey.shade400 : const Color.fromRGBO(66, 66, 66, 1),
    );
  }
}
