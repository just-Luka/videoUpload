import 'package:blindside_task/data/video_model.dart';
import 'package:blindside_task/domain/cubit/comment_cubit.dart';
import 'package:blindside_task/presentation/widgets/buttons/add_comment_button.dart';
import 'package:blindside_task/presentation/widgets/videos/bundles/video_particular_bundle.dart';
import 'package:blindside_task/presentation/widgets/videos/video_bottom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoPage extends StatelessWidget {
  final VideoModel videoModel;

  const VideoPage({
    Key? key,
    required this.videoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocBuilder<CommentCubit, CommentState>(
        builder: (context, state) {
          if (state is CommentShow) {
            return const AddCommentButton();
          }
          return const SizedBox();
        },
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SafeArea(
              child: VideoParticularBundle(videoModel: videoModel),
            ),
          ),
          const SliverToBoxAdapter(
            child: VideoBottomSwitch(),
          )
        ],
      ),
    );
  }
}
