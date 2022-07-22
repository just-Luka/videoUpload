import 'dart:async';

import 'package:blindside_task/data/models/video_model.dart';
import 'package:blindside_task/presentation/widgets/videos/frames/video_frame_mixin.dart';
import 'package:blindside_task/presentation/widgets/videos/frames/zoom_in_video_frame.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ConcreteVideoFrame extends StatefulWidget {
  final VideoModel videoModel;

  const ConcreteVideoFrame({
    Key? key,
    required this.videoModel,
  }) : super(key: key);

  @override
  State<ConcreteVideoFrame> createState() => _ConcreteVideoFrameState();
}

class _ConcreteVideoFrameState extends State<ConcreteVideoFrame>
    with VideoFrameMixin {
  bool _isVideoRun = false;
  bool _isVideoInFocus = false;

  late VideoPlayerController _controller;
  Timer? _videoFocusTime;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.videoModel.file)
      ..initialize().then((value) => {setState(() {})});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _videoInFocus() {
    _videoFocusTime?.cancel();

    setState(() {
      _isVideoInFocus = !_isVideoInFocus;
    });

    _videoFocusTime = Timer(
      const Duration(seconds: 3),
      () => setState(() {
        _isVideoInFocus = false;
      }),
    );
  }

  void _updateVideoRunState() {
    setState(() {
      _isVideoRun = !_isVideoRun;
    });

    if (_isVideoRun == true) {
      _controller.play();
    } else {
      _controller.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Hero(
          tag: 'video',
          child: GestureDetector(
            onTap: () {
              _videoInFocus();
            },
            child: Center(
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : SizedBox(),
              ),
            ),
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: switchVideoAttributes(
              _isVideoRun, _isVideoInFocus, _updateVideoRunState),
        ),
        _isVideoRun && !_isVideoInFocus
            ? const SizedBox()
            : Positioned(
                right: 5,
                bottom: 5,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(_VideoZoomInRoute(_controller));
                  },
                  icon: const Icon(
                    Icons.zoom_in_map,
                  ),
                ),
              ),
      ],
    );
  }
}

Route _VideoZoomInRoute(VideoPlayerController controller) {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          ZoomInVideoFrame(playerController: controller),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 500));
}
