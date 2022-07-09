import 'package:blindside_task/domain/cubit/comment_cubit.dart';
import 'package:blindside_task/domain/cubit/video_cubit.dart';
import 'package:blindside_task/presentation/frames/sliver_center_frame.dart';
import 'package:blindside_task/presentation/widgets/buttons/add_video_button.dart';
import 'package:blindside_task/presentation/widgets/category_chip.dart';
import 'package:blindside_task/presentation/widgets/custom_appbar.dart';
import 'package:blindside_task/presentation/widgets/videos/bundles/video_home_bundle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoCubit(),
      child: Scaffold(
        floatingActionButton: const AddVideoButton(),
        body: CustomScrollView(
          slivers: [
            const SliverCenterFrame(
              sliver: CustomAppbar(),
            ),
            const SliverToBoxAdapter(
              child: CategoryChip(),
            ),
            BlocBuilder<VideoCubit, VideoState>(
              builder: (context, state) {
                if (state is VideoUploaded) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: state.files.length,
                      (context, index) {
                        return VideoHomeBundle(
                          file: state.files[index],
                        );
                      },
                    ),
                  );
                }
                return const SliverToBoxAdapter(child: SizedBox());
              },
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 15),
            ),
          ],
        ),
      ),
    );
  }
}
