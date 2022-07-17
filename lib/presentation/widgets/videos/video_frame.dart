import 'package:blindside_task/data/models/video_model.dart';
import 'package:blindside_task/presentation/widgets/painters/triangle_painter.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoFrame extends StatefulWidget {
  final VideoModel videoModel;

  const VideoFrame({
    Key? key,
    required this.videoModel,
  }) : super(key: key);

  @override
  State<VideoFrame> createState() => _VideoFrameState();
}

class _VideoFrameState extends State<VideoFrame> {
  bool _isVideoRun = false;
  late VideoPlayerController _controller;

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

  _updateVideoRunState() {
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
        InkWell(
          onTap: () {
            _updateVideoRunState();
          },
          child: SizedBox(
            width: double.infinity,
            height: 200,
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(),
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _isVideoRun
              ? const SizedBox()
              : ElevatedButton(
                  onPressed: () => _updateVideoRunState(),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(const CircleBorder()),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(20)),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.black.withOpacity(0.1),
                    ),
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.grey.shade400;
                      },
                    ),
                  ),
                  child: CustomPaint(
                    child: CustomPaint(
                      painter: TrianglePainter(
                        strokeColor: Colors.white,
                        strokeWidth: 10,
                        paintingStyle: PaintingStyle.fill,
                      ),
                      child: const SizedBox(
                        height: 30,
                        width: 28,
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
